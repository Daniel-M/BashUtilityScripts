{
	# Heruistic value for character limit
	char_limit = 70
	
	# Check if first 'field' is a comment block
	# and worths to make changes
	if( $1 == "//" && NF > 2)
	#if( $1 == "//")
	{
		# Clear trailing spaces on comment blocks
		gsub(/ *$/,"",$0)

		# Here we store the total amount of characters of each field
		# i.e. each word we encounter
		sum = 0
	
		# Be begin interating through fields
		for(i=1;i<NF;i++)
		{
			# Print each word sepparated by spaces
			printf("%s ",$i)

			# add the amount of characters so far
			# plus one due to the space
			sum += length($i) + 1
		
			# check if we have reached or surpased limit
			# taking into account our last field (word) length
			if(sum >= char_limit-length($NF))
			{
				# We put a new line
				printf("\n// ")
				# We reset our counter to begin character counting again
				sum = 0	
			}
		}
		# We add a new line and place the last word (field)
		printf("%s\n",$NF)
	
		# Remove any trailing spaces
		gsub(/ *$/,"",$0)
	}
	# If it is not a comment block leave it as it is
	else
	{
		# print the line as regular
		print $0
	}
}
