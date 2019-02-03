#!/bin/bash

s3bucket='jcatalu-qs-athena-workshop-2'
rootFolder='B2B'

profile='jcataluna'

for file in *.csv; do

    # Extract folder name from file name
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "$file: $filename, $extension"

    # Create folder
    aws --profile $profile s3api put-object --bucket $s3bucket --key "$rootFolder/$filename/"

    # Upload the file
    aws --profile $profile s3 cp $file "s3://$s3bucket/$rootFolder/$filename/$file"

done