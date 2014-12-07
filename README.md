pacman
======

Parses credit card transactions from Itau HTML source file


## API

To upload a file and received the parsed CSV:
`curl -F "file=@.path/to/your/file.html;type=text/text" http://pacman-app.herokuapp.com/upload
