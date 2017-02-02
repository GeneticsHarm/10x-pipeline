#MOLGENIS walltime=23:59:00 nodes=1 mem=20gb ppn=4

### variables to help adding to database (have to use weave)
#string projectDir
###
#string stage
#string checkStage
#string jdkVersion
#string bamToolsPath
#string bamPath
#string splitBamDir
#string barcodePath

#Load modules
${stage} Java

#check modules
${checkStage}

echo "## "$(date)" Start $0"

if java -Xmx12g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${TMPDIR} \
 -jar ${bamToolsPath} -s -i ${bamPath} -b ${barcodePath} -o ${splitBamDir} \

then
 echo "returncode: $?";
else
 echo "returncode: $?";
 echo "fail";
fi

echo "## "$(date)" ##  $0 Done "
