#MOLGENIS walltime=23:59:00 mem=500mb nodes=1 ppn=8

### variables to help adding to database (have to use weave)
###

#string stage
#string checkStage

#string deduppedBamDir
#string featureCountsPath
#string humanGtf
#string countsDir
#string cellGroup

echo "## "$(date)" Start $0"

mkdir -p ${countsDir}/${cellGroup}

for currentBamFile in ${deduppedBamDir}/${cellGroup}/*.bam; do
    filename=$(basename ${currentBamFile})
    filename="${filename%.*}"
    echo "${filename}"

    if ${featureCountsPath} \
        -s 1 \
        -T 8 \
        -t exon \
        -g gene_id \
        -a ${humanGtf} \
        -o ${countsDir}/${cellGroup}/${filename}.txt \
        ${currentBamFile}
    then
        echo "returncode: $?";
        echo "counted bam ${currentBamFile}";
    else
        echo "returncode: $?";
        echo "fail";
    fi
done

echo "## "$(date)" ##  $0 Done "
