#MOLGENIS walltime=23:59:00 mem=16gb nodes=1 ppn=8

### variables to help adding to database (have to use weave)
###

#string stage
#string checkStage

#string countsDir
#string countsToMatrixPath
#string matrixDir

#Load module
${stage} Java

#Check modules
${checkStage}

mkdir -p ${matrixDir}

echo "## "$(date)" Start $0"

if java -jar -Xmx12g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${TMPDIR} ${countsToMatrixPath} \
    -i ${countsDir} \
    -o ${matrixDir} 
then
    echo "returncode: $?";
else
    echo "returncode: $?";
    echo "fail";
fi

echo "## "$(date)" ##  $0 Done "

