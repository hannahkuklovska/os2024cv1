
#!/bin/bash

# spustenie toho, čo som si spravila predtým


# pre každú hodnotu z nacitanych
for arxiv_id in "$@"; do
    # Načíta stránku preprintu z arXiv
    nacitane=$(curl -s "https://arxiv.org/abs/$arxiv_id")
    
    # Oddelenie bibliografických údajov pre každý preprint
    echo "---"

    # len vnutra, medzi "" zachytenie cez sed 
    # zacinajuce name="citation_title"
    title=$(echo "$nacitane" | grep '<meta name="citation_title"' | sed 's/.*content="\([^"]*\)".*/\1/')
    authors=$(echo "$nacitane" | grep '<meta name="citation_author"' | sed 's/.*content="\([^"]*\)".*/\1/')
    date=$(echo "$nacitane" | grep '<meta name="citation_date"' | sed 's/.*content="\([^"]*\)".*/\1/')
    online_date=$(echo "$nacitane" | grep '<meta name="citation_online_date"' | sed 's/.*content="\([^"]*\)".*/\1/')
    pdf_url=$(echo "$nacitane" | grep '<meta name="citation_pdf_url"' | sed 's/.*content="\([^"]*\)".*/\1/')

    echo "title=\"$title"
    echo "author=\"$author"
    echo "date=\"$date"
    echo "online_date=\"$online_date"
    echo "pdf_url=\"$pdf_url"
    echo "arxiv_id=\"$arxiv_id"




done 
