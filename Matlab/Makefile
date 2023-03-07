F = note
F_MD=$(F).md
F_PDF=$(F).pdf
	# --lua-filter=/home/fra/Projects/Project_create/md/center.lua \
	# --highlight-style zenburn \

	# to be insterted in *.bib if needed
	# @book{DUMMY:2,
	#   NUMBER: = 2,
	#   AUTHOR = "John Doe",
	#   TITLE = "The Book without Title",
	#   PUBLISHER = "Dummy Publisher",
	#   YEAR = "2100",
	# }

	# @book{DY:1,
	#   NUMBER: = 2,
	#   AUTHOR = "Jo Doo",
	#   TITLE = "The Book with Title",
	#   PUBLISHER = "DPublisher",
	#   YEAR = "2010",
	# }

target: 
	pandoc -s -i -N -o $(F_PDF) $(F_MD) +RTS -Ksize -RTS
