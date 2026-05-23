#Descargar las familias de pfam

cd
ls

cd Especializacion

#Descargar la base de datos de Pfam
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz

#Descomprimir
 gunzip Pfam-A.hmm.gz

#Indexar
 hmmpress Pfam-A.hmm
 hmmfetch --index Pfam-A.hmm

#Crear un archivo para las descargas
nano descargar_pfam.sh

#Pegar
#!/bin/bash

familias=(
"Pkinase"
"Pkinase_Tyr"
"Ras"
"SH2"
"SH3_1"
"zf-C2H2"
"Homeobox"
"HTH_1"
"bZIP_1"
"Myb_DNA-binding"
"RRM_1"
"DEAD"
"KH_1"
"dsrm"
"ABC_tran"
"MFS_1"
"Ion_trans"
"HlyD"
"Aminotran_1_2"
"Aldedh"
"TIM"
"NAD_binding_1"
"GST_C"
"WD40"
"Ank"
"TPR_1"
"LRR_1"
"HSP70"
"HSP20"
"DnaJ"
"Response_reg"
"HisKA"
"Peptidase_M16"
"Sigma70_r2"
"ig"
"EGF"
"Cadherin"
"FN3"
)

mkdir -p PFAM_FAMILIAS

for fam in "${familias[@]}"
do
    echo "Descargando $fam ..."
    hmmfetch Pfam-A.hmm "$fam" > "PFAM_FAMILIAS/${fam}.hmm"
done

cat PFAM_FAMILIAS/*.hmm > PFAM_FAMILIAS/familias_pfam.hmm

echo "Proceso terminado"

#Dar permisos
chmod +x descargar_pfam.sh

#Descargar
./descargar_pfam.sh

#Indexar
hmmpress PFAM_FAMILIAS/familias_pfam.hmm
