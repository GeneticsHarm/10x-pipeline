#MOLGENIS walltime=23:59:00 mem=500mb nodes=1 ppn=4

### variables to help adding to database (have to use weave)
###

#string stage
#string checkStage

#string cythonVersion
#string futureVersion
#string pysamVersion
#string pandasVersion
#string numpyVersion

#string cellGroup

#string splitBamDir
#string deduppedBamDir
#string umiToolsDir

#Load modules
${stage} Cython/${cythonVersion}
${stage} future/${futureVersion}
${stage} Pysam/${pysamVersion}
${stage} pandas/${pandasVersion}
${stage} numpy/${numpyVersion}

#Check modules
${checkStage}

echo "## "$(date)" Start $0"

mkdir -p ${deduppedBamDir}/${cellGroup}

for currentBamFile in ${splitBamDir}/${cellGroup}/*.bam; do
    if python ${umiToolsDir} \
        --method unique \
        -I ${currentBamFile} \
        -S ${deduppedBamDir}/${cellGroup}/$(basename ${currentBamFile})
    then
    	echo "returncode: $?";
        echo "dedupped bam ${currentBamFile}";
    else
    	echo "returncode: $?";
        echo "fail";
    fi
done

echo "## "$(date)" ##  $0 Done "

