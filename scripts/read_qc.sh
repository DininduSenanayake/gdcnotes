#Run FastQC

set -e

#Loading the software stack for DataWrangling episode. This is specific to NeSI Mahuika platform
source ~/modload.sh

cd ~/dc_workshop/data/untrimmed_fastq

echo "Running FastQC"
fastqc *.fastq*

mkdir -p ~/dc_workshop/results/fastqc_untrimmed_reads

echo "Saving FastQC results.."

mv *.zip ~/dc_workshop/results/fastqc_untrimmed_reads/
mv *.html ~/dc_workshop/results/fastqc_untrimmed_reads/

cd ~/dc_workshop/results/fastqc_untrimmed_reads/

echo "Unzipping..."
for filename in *.zip
do
    unzip $filename
done

echo "Saving summary...."
cat */summary.txt > ~/dc_workshop/docs/fastqc_summaries.txt
