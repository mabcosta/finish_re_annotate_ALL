# Your CSV file
csv_file="input_wgs2.csv"

# Loop through the CSV file, processing two lines at a time
count=0
while IFS= read -r line1 && IFS= read -r line2; do
    # Process two lines at a time
	echo patient,sample,cram,crai > input2.tmp
    echo "$line1" >> input2.tmp
    echo "$line2" >> input2.tmp
    echo  # Add an empty line between each pair of lines
    ((count+=2))

	echo "Sarek running..." 
	cut -f 1 -d , input2.tmp | tail -2 

	# nextflow run nf-core/sarek \
	# -r 3.2.3 \
	# -c /home/mcosta/sarek/countzero.config \
	# -profile docker \
	# --genome GATK.GRCh38 \
	# --tools haplotypecaller,vep \
	# --vep_custom_args "--everything --per_gene --total_length --offline --format vcf --tab" \
	# --input input2.tmp \
	# --outdir /media/pontikos_nas2/MarcosCosta/sarek/re_wgs \
	# --step variant_calling \
	# -w /scratch/mcosta/sarek

done < "$csv_file"
