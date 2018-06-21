# flp_leaves_conversion
Convert the spreadsheet of FLP leaves into a spreadsheet to be ingested into OPenn. Uses Excel, Open Refine, and XSLT, converting the data from Excel to HTML/XML, to CSV.

Basic workflow:

* Configure the FLP worksheet columns to align with the columns used in the Geniza project. There are a few columns that don't map, columns are moved, and some columns are combined (this work was done in OpenRefine)
* Tidy up and standardize values in columns (e.g., the list of creators). In practice I went back and forth between Excel and OpenRefine a few times, but the work was finished in OpenRefine
* Export an HTML file from OpenRefine (FLP-Lewis-Master-Spreadsheet.html)
* Process FLP_import_notes.xsl against FLP-Lewis-Master-Spreadsheet.html to pull the notes from FLP_full_notes.html into the Master Spreadsheet.
* Process FLP_html2csv.xsl against FLP-Lewis-Master-Spreadsheet.html (now with all the notes) to generate bibliophilly_leaves.csv, which is what will be loaded into OPenn. The original spreadsheet (and the HTML) has one row for each image file, and a single leaf/cutting may have two or more image files associated with it. The XSLT combines all the images for a single leaf into one row.

