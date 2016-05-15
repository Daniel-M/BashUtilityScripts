{
	# Heruistic value for character limit
	char_limit = 79

	# Clear any spaces at the beggining of line
	# when theres a comment block opening "//"
	gsub(/^ {1,}\/\//,"//",$0)
	
	# Check the presence of "//" at the beggining of the line ($0)
	# Also checks that there are several words on the line (NF > 2)
	# And that the line doesnt contain the word Copyright
	if( $0 ~ "^//" && NF > 2 && $1 !~ "Copyright" )
	{
		# Clear trailing spaces on comment blocks
		gsub(/ *$/,"",$0)

		# Add one space after each // followed by a char. (like //Word)
		gsub(/\/\//,"// ",$0)

		# Here we store the total amount of characters of each field
		# i.e. each word we encounter
		# We add 3 characters due to the // and the space ("// ")
		sum = 3
	
		# Be begin interating through fields
		for(i=1;i<NF;i++)
		{
			# Print each word sepparated by spaces
			printf("%s ",$i)

			# add the amount of characters so far
			# plus one due to the space
			sum += length($i) + 1
		
			# Check if we have reached or surpased limit
			# by taking into account the size of the following field
			#if(sum + length($(i+1))+length($NF) > char_limit)
			if(sum + length($(i+1)) + 1 > char_limit)
			{
				# We put a new line
			 	#printf(" T=%d\n// ",sum)
			 	printf("\n// ")
				# We reset our counter to begin character counting again
				sum = 3	
			}
		}
		# We add a new line and place the last word (field)
		printf("%s\n",$NF)
		#printf("%s T=%d\n",$NF,sum)
	
		# Remove any trailing spaces
		gsub(/\w {1,}$/,"",$0)
	}
	# If it is not a comment block leave it as it is
	else
	{
		# print the line as regular
		print $0
	}
}
