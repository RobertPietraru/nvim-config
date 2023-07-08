local function contains_dot(str)
    return string.find(str, "%.")
end

local function snake_to_camel_case(snake_case_string)
    local camel_case_string = snake_case_string:gsub("_(%w)", function(c)
        return c:upper()
    end)
    return camel_case_string
end

local function capitalize_first_letter(str)
    return str:gsub("^%l", string.upper)
end

local function snake_to_pascal_case(snake_case_string)
	local camel_case = snake_to_camel_case(snake_case_string)
	return capitalize_first_letter(camel_case)
end


local function get_cubit_file_text(name, cubit_template)
	local name_pascal = snake_to_pascal_case(name);
	local file1 = string.gsub(cubit_template, "{snake_case}", name)
	return string.gsub(file1, "{pascal_case}", name_pascal)
end
local function create_file(filename, text)
    local file = io.open(filename, "w")
    if (file ~= nil) then
    	file:write(text)
    	file:close()
    end
end
local cubit_file = [[
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '{snake_case}_state.dart';

class {pascal_case}Cubit extends Cubit<{pascal_case}State> {
  {pascal_case}Cubit() : super(const {pascal_case}InitialState());
}
]]

local state_file = [[
part of '{snake_case}_cubit.dart';

abstract class {pascal_case}State extends Equatable {
  const {pascal_case}State();
}

class {pascal_case}InitialState extends {pascal_case}State {
  const {pascal_case}InitialState();
  @override
  List<Object?> get props => [];
}

class {pascal_case}ErrorState extends {pascal_case}State {

  const {pascal_case}ErrorState();
  @override
  List<Object?> get props => [];
}

class {pascal_case}LoadingState extends {pascal_case}State {
  const {pascal_case}LoadingState();
  @override
  List<Object?> get props => [];
}

class {pascal_case}RetrivedState extends {pascal_case}State {

  const {pascal_case}RetrivedState();

  @override
  List<Object?> get props => [];
}

]]
local function get_parent_directory(path)
    local parent_directory = path:match("(.+\\).+")
    return parent_directory
end


-- local manager = require("neo-tree.sources.manager")
-- local state manager.get_state("filesystem")

local path = vim.api.nvim_buf_get_name(0)
--local path = vim.fn.expand('%')
local directory = get_parent_directory(path)

local function create_cubit(name, relative_path_file)
	local relative_path;
	if (contains_dot(relative_path_file)) then
		relative_path = get_parent_directory(relative_path_file);
	 else
		relative_path = relative_path_file;
	end

	local cubit_folder_path = relative_path..name.."_cubit";
	os.execute("mkdir "..cubit_folder_path)
	cubit_folder_path = cubit_folder_path.."\\"

	-- print("Cubit folder: "..cubit_folder_path)
	local cubit_path = cubit_folder_path .. name .. "_cubit.dart";
	local state_path = cubit_folder_path .. name .. "_state.dart";
	-- print("Cubit file path:"..cubit_path)
	-- print("State file path:"..state_path)

	local cubit_text = get_cubit_file_text(name, cubit_file)
	local state_text = get_cubit_file_text(name, state_file)

	create_file(cubit_path, cubit_text)
	create_file(state_path, state_text)
end

local api = require "nvim-tree.api"


--- the cubit will be the child of the folder or the sibling of the file
vim.keymap.set("n", "<leader>q", function()
	local input = vim.fn.input("name (snake_case): ")
	if (input == "")then
		print("Aborted cubit creation")
		return;
	end
	local clipboard_before = vim.fn.getreg("*");
	api.fs.copy.relative_path()
	local clipboard_after = vim.fn.getreg("*");
	vim.fn.setreg("*", clipboard_before)
	create_cubit(input, clipboard_after)
end)

--- so like if you have multiple folders and you want the cubit to be one of their siblings
vim.keymap.set("n", "<leader>Q", function()
	local input = vim.fn.input("name (snake_case): ")
	if (input == "")then
		print("Aborted cubit creation")
		return;
	end
	local clipboard_before = vim.fn.getreg("*");
	 api.fs.copy.relative_path()
	local clipboard_after = vim.fn.getreg("*");
	vim.fn.setreg("*", clipboard_before)
	if (not contains_dot(clipboard_after)) then
		clipboard_after = get_parent_directory(clipboard_after)
	end
	create_cubit(input, clipboard_after)
end)
