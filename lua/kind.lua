--- LSP Completion kind.

local kind = vim.lsp.protocol.CompletionItemKind

-- I am not particularly a fan of icons for "everything".
-- (I mean wtf are these:
--     " " <- (is this supposed to mean "method"?)
--     " " <- (a Class???)
--     " " <- (omfg wtf is that (it's supposed to mean "interface" 😅))
-- )
-- BTW I by no means try to put down anyone's preferences. Some people would prefer that and for
-- them icons may be a nice addition to have. But I feel that they give me no iformation on the
-- completion item at all.
-- This configuration is just to replace long words in Pmenu but still give us a hint about the
-- option.

local my_kind = {
	Text = "abc",
	Method = "x.()",
	Function = "f(x)",
	Constructor = "A()",
	Field = "A.b",
	Variable = "var",
	Class = "Class",
	Interface = "I{}",
	Module = "Mod",
	Property = "prop",
	Unit = "unit",
	Value = "value",
	Enum = "enm{}",
	Keyword = "kwrd",
	Snippet = "snip",
	Color = "colour",
	File = "file",
	Reference = "ref",
	Folder = "dir",
	EnumMember = "{enm}",
	Constant = "const",
	Struct = "str{}",
	Event = "ev",
	Operator = "+-*/",
	TypeParameter = "<T>",
}

for k, v in pairs(my_kind) do
	kind[kind[k]] = v
end
