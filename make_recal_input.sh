# Make path file

#Exomes

ls /media/pontikos_nas2/MarcosCosta/sarek/exomes/preprocessing/recalibrated/*/*.cram > all_wes_cram.tmp
ls /media/pontikos_nas2/MarcosCosta/sarek/exomes/preprocessing/recalibrated/*/*.crai > all_wes_crai.tmp


wes_list=$(grep -v nf_ missing.vcf.wes.txt)

echo "patient,sample,cram,crai" > wes_input.csv

for wes in $wes_list; do
	echo $wes
	cram=$(grep -w $wes all_wes_cram.tmp)
	crai=$(grep -w $wes all_wes_crai.tmp)
	echo "$wes,$wes,$cram,$crai" >> wes_input.csv
done


#Genomes

ls /media/pontikos_nas2/MarcosCosta/sarek/genomes/preprocessing/recalibrated/*/*.cram > all_wgs_cram.tmp
ls /media/pontikos_nas2/MarcosCosta/sarek/genomes/preprocessing/recalibrated/*/*.crai > all_wgs_crai.tmp


wgs_list=$(grep -v nf_ missing.vcf.wgs.txt)

echo "patient,sample,cram,crai" > wgs_input.csv

for wgs in $wgs_list; do
	echo $wgs
	cram=$(grep -w $wgs all_wgs_cram.tmp)
	crai=$(grep -w $wgs all_wgs_crai.tmp)
	echo "$wgs,$wgs,$cram,$crai" >> wgs_input.csv
done