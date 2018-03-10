# flp_leaves_conversion
Convert the spreadsheet of FLP leaves into a spreadsheet to be ingested into OPenn

Basic workflow:

* Align the FLP worksheet columns with the columns used in the Geniza project. There are a few columns that don't map, columns are moved, and some columns are combined (which was done in OpenRefine)
* Load the spreadsheet into OpenRefine to combine columns and clean values (e.g., the list of creators). In practice I went back and forth between Excel and OpenRefine a few times, but the work was finished in OpenRefine
* Export an HTML file from OpenRefine (FLP-Lewis-Master-Spreadsheet.html)
* Process FLP_html2csv.xsl against FLP-Lewis-Master-Spreadsheet.html to generate test.csv, which is approximately what will be loaded into OPenn. The original spreadsheet (and the HTML) has one row for each image file, and a single leaf/cutting may have two or more image files associated with it. The XSLT combines all the images for a single leaf into one row.
