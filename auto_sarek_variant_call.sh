
echo "Sarek running..."
nextflow run nf-core/sarek \
	-r 3.2.3 \
	-c /home/mcosta/sarek/countzero.config \
	-profile docker \
	--genome GATK.GRCh38 \
	--tools haplotypecaller,vep \
	--vep_custom_args "--everything --per_gene --total_length --offline --format vcf --tab" \
	--input wgs_input.csv \
	--outdir /media/pontikos_nas2/MarcosCosta/sarek/re_wes \
	--step variant_calling \
	-w /scratch/mcosta/sarek
	

# Params for WES analysis
#	--no_intervals \
#	--wes \
