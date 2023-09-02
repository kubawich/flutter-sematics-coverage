#!/bin/bash

# Initialize a flag to indicate failure
has_failure=0

# Initialize a variable to store feedback
feedback=""

# Loop through all Dart files in the repository
for file in $(find . -name '*.dart'); do
  # Initialize a variable to store class names
  class_names=""
  
  # Extract class names from the Dart file
  class_names=$(grep -o -E 'class [A-Za-z0-9_]+ ' $file | awk '{print $2}')

  for class_name in $class_names; do
    # Extract the content of each class into a variable
    class_content=$(awk "/class $class_name /,/^}/" $file)

    # Check if the class content contains a Semantics widget
    if [[ ! $class_content == *"Semantics("* ]]; then
      feedback="$feedback\nNo Semantics widget found in class $class_name in file $file"
      has_failure=1
    else
      feedback="$feedback\nSemantics widget found in class $class_name in file $file"
    fi
  done
done

# Print the feedback
echo -e $feedback

# Exit with the appropriate status code
if [ $has_failure -eq 1 ]; then
  exit 1
else
  exit 0
fi
