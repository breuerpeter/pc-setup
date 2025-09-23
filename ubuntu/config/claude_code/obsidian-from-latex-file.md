# LaTeX summary page to Obsidian note

I am collecting notes for individual concepts in my knowledge base (Obsidian vault), following the Zettelkasten method (so each concept gets its own note). Each note must be structured as follows:

1. One sentence that summarizes very concisely what method/idea is being detailed in this note (don't include this description, just sentence)
2. Content (don't actually create a title "Content" but think of a good structure of the content into sections)
3. Nomenclature/symbols table (title: "Symbols")
	- Table with 2 columns "Symbol" and "Description" to explain any Latex symbols used

Each note must adhere have the following properties:
- Concise, exact language
- Any LaTeX must be Mathjax compatible, this means (examples):
	- Inline math between single $, otherwise double $
	- Use "\boldsymbol" instead of "bm"
	- Use "\boxed{}" for any boxed content
	- Eg "\color{red}" for colored symbols (to make long multiline equations easier to follow)
	- Use "\dots" instead of "\hdots"
- Don't put any extra blank rows after headers ie keep the content as close together as possible
- Use normal (not title) case for section headers (ie only first letter capitalized)
- Don't add the title in the note itself, but use it as the file name since Obsidian displays the file name as the title
- Info should never be repeated ie info must only be on one note
- Only end a sentence that is part of a bullet point with a full stop if there is a new sentence following it (as part of the same bullet point)

Further instructions: only give me the files ie don't comment on anything you do

$ARGUMENTS

I am migrating from this LaTeX summary sheet to my Obsidian notes vault. 
Create the Zettelkasten notes from this content as markdown files. 

I want the notes to resemble the original structure as much as possible - so do not change aligned equations and keep the exact order (eg equation, comment, equation, etc.) of the original.  Put the notes in the following directory: "./Knowledge/TEMP robot dynamics". Use the existing notes in there as a template. Don't edit any of the existing files, only add new one(s).