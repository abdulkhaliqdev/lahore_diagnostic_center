# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)





procedure = [
  ['Ultrasound', 'Ultrasound Abdomen', 1000],
  ['Ultrasound', 'Ultrasound Abdomen and Pelvis', 1400],
  ['Ultrasound', 'Ultrasound Kidney Ureter and Bladder', 1000],
  ['Ultrasound', 'Ultrasound Obs and Gynae', 100],
  ['Ultrasound', 'Ultrasound Cranium', 1500],
  ['Ultrasound', 'Ultrasound Orbit', 1500],
  ['Ultrasound', 'Ultrasound Neck', 1500],
  ['Ultrasound', 'Ultrasound Parotid Gland', 1500],
  ['Ultrasound', 'Ultrasound Thyroid', 1500],
  ['Ultrasound', 'Ultrasound Chest', 1000],
  ['Ultrasound', 'Ultrasound Breast', 1500],
  ['Ultrasound', 'Ultrasound Inguinoscrotum', 1500],
  ['Ultrasound', 'Ultrasound Hip and Knee', 1500],
  ['Ultrasound', 'Ultrasound Perineum', 1500],
  ['Ultrasound', 'Ultrasound Perianal Fistu]las', 2000],
  ['Ultrasound', 'Ultrasound of Soft Tissue]s', 1500],
  ['X-Ray', 'Xray per expoure', 700],
  ['X-Ray', 'X-Ray Abdomen', 700], 
  ['X-Ray', 'X-Ray Axial and Appendicular Skeleton', 700],
  ['X-Ray', 'X-Ray Skull and Paranasal Sinuses', 700],
  ['X-Ray', 'X-Ray Chest', 700],
  ['Procedure', 'DIGITAL COLOR DOPPLER ULTRASOUND', 700], 
  ['Procedure', 'Hepatoportal System', 1500],
  ['Procedure', 'Mesenteric Artery', 1500],
  ['Procedure', 'Aorta', 2000],
  ['Procedure', 'Arterio Venous Fistula Mapping', 2500],
  ['Procedure', 'Renal Artery', 2500],
  ['Procedure', 'Carotid Arteries', 2500],
  ['Procedure', 'Upper Limb Arterial and Venous Doppler', 2500],
  ['Procedure', 'Lower Limb Arterial and Venous Doppler', 2500],
  ['Procedure', 'Contrast Procedures including Barium Studies, Contrast assessment of Vesicovaginal and Perianal Fistulas , Sinograms, Urethrograms and Hysterosalpingoraphy', 2500],
  ['Procedure', 'Obstetrical Scan', 1000],
  ['Procedure', 'Twin/Triplet Scan', 1500],
  ['Procedure', 'Nuchal Translucency and Thickness assessment', 1000],
  ['Procedure', 'Amniocentesis', 1000],
  ['Procedure', 'Choriocentesis/ Chorionic Villus Sampling', 1000],
  ['Procedure', 'Anomaly Scan', 1500],
  ['Procedure', 'Umblical artey and Fetal MCA Doppler', 1500],
  ['Procedure', 'Biophysical Profile', 1500],
  ['Procedure', 'Uterine artery Doppler', 1500],
  ['Procedure', 'Follicular Tracking', 1500],
  ['Procedure', 'Transvaginal Scan for Pelvic Visceras', 1000],
  ['Procedure', 'Transvaginal Scan For Early Fetal Evaluation', 1500],
  ['Procedure', 'Barium Swallow', 4000],
  ['Procedure', 'Barium Meal and Follow Through', 6000],
  ['Procedure', 'Distal Loopogram', 6000],
  ['Procedure', 'Intravenous Urogram', 7000],
  ['Procedure', 'MCUG', 6000],
  ['Procedure', 'Retrograde Urethrogram', 3500],
  ['Procedure', 'Cystogram', 3500],
  ['Procedure', 'Fistulogram', 3000],
  ['Procedure', 'Sinogram', 3000],
  ['Procedure', 'Hysterosalpingography', 6500],
  ['Procedure', 'MRI & CT REPORTING', 1500],
]

procedure.each do |data|
  Procedure.create(procedure_type: data[0], title: data[1], price: data[2])  
end

User.create(email: 'a@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'Abdul khaliq', role: 'admin')
User.create(email: 'b@gmail.com', password: '123456789', password_confirmation: '123456789', name: 'Abdul khaliq', role: 'receptionist')

# Ultrasound	Abdomen & KUB
# Ultrasound	Abdomen & Pelvic + Anterior abdominal wall with hernia protocol
# Ultrasound	Abdomen & Pelvis with CT scan comparison
# Ultrasound	Abdomen & Pelvis with MRI comparison
# Ultrasound	Abdomen and anterior abdominal wall with hernia protocol
# Ultrasound	Abdomen+ Pelvis+ TVS+CT / MRI Comparison
# Ultrasound	Abdominal & Pelvic Ultrasound
# Ultrasound	Abdominal Doppler
# Ultrasound	Abdominal Doppler for Aorta / Mesenteric artery evaluation
# Ultrasound	Abdominal Doppler for Portal Vein
# Ultrasound	Abdominal Ultrasound
# Ultrasound	Abdominal ultrasound with MRI comparison
# Procedure	Amniocentesis
# Ultrasound	Anomaly Obs. Ultrasound
# Procedure	Ascitic / Pleural Drainage procedures (Diagnostic)
# Procedure	Ascitic / Pleural Drainage procedures (Therapeutic)
# Procedure	Aspiration
# Procedure	BARD Monopty Biopsy Needle
# X-Ray	Barium Enema
# X-Ray	Barium Enema (Double Contrast)
# X-Ray	Barium Meal & Follow Through
# X-Ray	Barium Swallow (Esophagogram)
# Ultrasound	Basic Ultrasound course including general Abdomen, Breast, Obstetric and Gynaecology Ultrasounds
# Ultrasound	Basic Ultrasound General Abdomen, Breast, Obs and Gynae including TVS Ultrasound.
# Ultrasound	Basic Ultrasound General Abdomen, Breast, Obs and Gynae including TVS Ultrasound.
# Ultrasound	Basic Ultrasound Short Course Of Gynae & Obs.
# Ultrasound	Bilateral Breast Ultrasound
# Ultrasound	BILATERAL INGUINAL ULTRASOUND (HERNIA PROTOCOL)
# Ultrasound	Bilateral lower limb (Arterial and Venous) Ultrasound
# Ultrasound	Bilateral Lower Limb Doppler (Double system)
# Ultrasound	BILATERAL LOWER LIMBS (ARTERIAL & VENOUS) DOPPLER ULTRASOUND
# Ultrasound	BILATERAL LOWER LIMBS (ARTERIAL) DOPPLER ULTRASOUND
# Ultrasound	BILATERAL LOWER LIMBS (VENOUS) DOPPLER ULTRASOUND
# Procedure	Bilateral Mammogram + Breast Ultrasound
# Procedure	Biopsy Needle
# Procedure	Biopsy Needle and Material
# Ultrasound	Biopsy Of Liver, Gall Bladder or GIT
# Procedure	Blood Pressure via Digital Apparatus
# Procedure	Blood Sugar Level Via Glucometer
# X-Ray	BOTH KNEE JOINT (AP & LATERAL VIEWS)
# Ultrasound	Breast
# Procedure	Breast Cancer Diagnosis. Mammography 3500 with Breast Ultrasound 2500. Ultrasound Abdomen and Pelvis 3000. Chest X-ray 1000 Breast Biopsy with Needle Charges 10000. Total charges are 20000.
# Procedure	Breast Cyst Aspiration
# Ultrasound	Carotid Doppler
# Ultrasound	Carotid Doppler
# X-Ray	Chest PA view
# Ultrasound	Chest Ultrasound
# Ultrasound	Chest Ultrasound
# Procedure	Chorionic villous sampling (CVS)
# Ultrasound	Cranial Ultrasound
# Ultrasound	Cranial Ultrasound
# Procedure	CT and MRI Reporting
# Procedure	CT Scan Reporting
# Procedure	CVP line / Catheter / Pig tail placement
# Procedure	Cyst Aspiration
# X-Ray	Cystogram
# Ultrasound	Detailed Anomaly Colored Ultrasound
# Ultrasound	Detailed Anomaly Obstetrical Ultrasound
# Ultrasound	Detailed Obstetrical Ultrasound
# Ultrasound	Detailed Obstetrical Ultrasound
# Ultrasound	Doppler for AV fistula Mapping
# Ultrasound	Doppler Ultrasound Neck For Superior Vena Cava Assesment
# Ultrasound	Duplicate Record
# Ultrasound	Echocardiography
# Ultrasound	Endorectal Ultrasound for Prostate Evaluation
# Procedure	Fetal intracardiac methotrexate injection for ectopic pregnancy
# Procedure	Fistulagram
# Procedure	FNAC (Breast / Soft Tissue / Lymphnode)
# Procedure	FNAC (Lung / Renal / Abdominal node / Paravertebral)
# Ultrasound	FNAC of Thyroid
# Ultrasound	FNAC of Thyroid
# Ultrasound	Follicular Tracking Pelvic + TVS Ultrasound
# Ultrasound	Follicular tracking Pelvic Ultrasound
# X-Ray	Gastrostomy
# Ultrasound	Hip Ultrasound
# X-Ray	Hysterosalpingogram
# Procedure	Hysterosalpingogram
# X-Ray	I.U.C.D with uterine sound
# X-Ray	I.U.C.D with uterine sound + Pelvis
# Ultrasound	Inguinoscrotal
# Ultrasound	Inguinoscrotal USG
# Procedure	Inj. Ultravist (100 ml)
# X-Ray	Intravenous Urogram (IVP / IVU)
# X-Ray	Invertogram (Baby Gram)
# Ultrasound	KUB + Pelvic Ultrasound
# Ultrasound	KUB Ultrasound
# Ultrasound	KUB Ultrasound
# Ultrasound	KUB with full bladder + PMRV
# X-Ray	Loopogram (Distal)
# X-Ray	Loopogram (Proximal)
# Ultrasound	Lower limb doppler for varicose vein markings.
# X-Ray	Mammogram (Bilateral)
# X-Ray	Mammogram (Unilateral)
# Procedure	Material used during procedure
# Procedure	Material used during procedure
# X-Ray	MCUG
# Procedure	Miscellaneous / Decompression Hydrocephalus of fetus
# Procedure	MRCP REPORTING
# Procedure	MRI Reporting
# Ultrasound	Musculoskeletal Ultrasound
# Ultrasound	Neck + MRI Reporting
# Ultrasound	Neck / Thyroid
# Ultrasound	Neck / Thyroid
# Ultrasound	Neck / Thyroid
# X-Ray	Nephrostogram (Left)
# X-Ray	Nephrostogram (Right)
# Ultrasound	Obs Doppler with Biophysical Profile
# Ultrasound	Obstetric Doppler + Anomaly Ultrasound
# Ultrasound	Obstetric Doppler Ultrasound
# Ultrasound	Obstetrical + KUB / ABD Ultrasound
# Ultrasound	Obstetrical + KUB / ABD Ultrasound
# Ultrasound	Obstetrical Ultrasound
# Ultrasound	Obstetrical Ultrasound
# Ultrasound	Orbital Ultrasound for Lens Evaluation
# Ultrasound	Parotid/ Submandibular Gland Ultrasound
# Ultrasound	Pelvic
# Ultrasound	Pelvic + Endovaginal Ultrasound
# Ultrasound	Pelvic Doppler
# Ultrasound	Pelvic Ultrasound
# Procedure	Penile Doppler Ultrasound
# X-Ray	Percutaneous Nephrostomy (PCN)
# Procedure	Percutaneous Nephrostomy Placement (PCN)
# Ultrasound	Perianal Ultrasound
# Ultrasound	Quadruplet Obstetrical Ultrasound
# X-Ray	RCUG + MCUG (Combined)
# Procedure	Renal Biopsy with Biopsy gun and procedure material
# Ultrasound	Renal Doppler
# Ultrasound	Repeat ultrasound (within one week)
# X-Ray	Reporting X-Ray Single Film
# X-Ray	Retrograde Pyelography
# X-Ray	Retrogram Urethrogram
# Ultrasound	RIGHT LOWER LIMB ARTERIAL DOPPLER ULTRASOUND
# X-Ray	Routine X-Ray (Single Film)
# X-Ray	ROUTINE X-RAY AP & LATERAL VIEW
# Procedure	Saline hysterosonography
# Ultrasound	Scrotal Doppler Ultrasound
# Ultrasound	Single Limb Doppler (Both Arterial and Venous)
# Ultrasound	SINGLE LOWER LIMB (ARTERIAL & VENOUS) DOPPLER ULTRASOUND
# Ultrasound	Single lower limb (Arterial & Venous) Doppler Ultrasound.
# Ultrasound	SINGLE LOWER LIMB ARTERIAL DOPPLER ULTRASOUND
# Ultrasound	SINGLE LOWER LIMB DOPPLER ULTRASOUND
# Ultrasound	SINGLE LOWER LIMB VENOUS DOPPLER ULTRASOUND
# X-Ray	Sinogram
# Ultrasound	SOFT TISSUE (Double Limb)
# Ultrasound	SOFT TISSUE (Single Limb)
# Ultrasound	Soft Tissue Ultrasound
# Procedure	Surgical material
# X-Ray	T. Tube Cholangiogram
# Ultrasound	Therapeutic ascitic fluid/ cyst aspiration.
# Ultrasound	Thyroid Ultrasound
# Ultrasound	Transrectal Ultrasound
# Ultrasound	Transvaginal Ultrasound For Pelvic Pathology
# Ultrasound	Triplet Obstetrical Ultrasound
# Procedure	Trucut Biopsy (Breast / Soft Tissue )
# Procedure	Trucut Biopsy Prostate gland
# Ultrasound	TVS for Fetal Evaluation
# Ultrasound	Twin Anomaly Obstetrical Ultrasound
# Ultrasound	Twin Detailed Obstetric Ultrasound
# Ultrasound	Twin Obstetrical Doppler Ultrasound and Bio Physical Profile
# Ultrasound	Twin Obstetrical Ultrasound
# Ultrasound	Ultrasound Abdomen & pelvis and TVS
# Ultrasound	Ultrasound both axillae with neck (for lymphadenopathy)
# Procedure	Ultrasound guided Biopsy of paratracheal mass
# Procedure	Ultrasound Guided Breast Biopsy
# Procedure	Ultrasound Guided Liver / Spleen / Gastrointestinal / Renal Biopsy
# Procedure	Ultrasound Guided Trucut Biopsy Abdominal Lymphnode / Adnexa
# Ultrasound	Ultrasound KUB+ Prostate +PMRV
# Ultrasound	Ultrasound Pelvis for Prostate Gland
# Ultrasound	Ultrasound Perianal with MRI comparison
# Ultrasound	Unilateral Lower Limb Doppler (Arterial & Venous)
# Ultrasound	Unilateral lower limb Doppler (Single system).
# X-Ray	Urethrogram Antegrade
# Ultrasound	Urine PH test
# Procedure	Urine Pregnancy Strip Test (UPT)
# Procedure	Urografin Injection
# X-Ray	Voiding Cysto Urethrogram (MCUG)
# X-Ray	X-RAY LUMBOSACRAL SPINE (AP & LATERAL VIEW)
# X-Ray	XRAY CERVICAL SPINE (AP & LATERAL VIEW)
# X-Ray	XRAY DORSAL SPINE (AP & LATERAL VIEW)
# X-Ray	XRAY LOWER LIMB (AP & LATERAL VIEW)
# X-Ray	XRAY SKULL SPINE (AP & LATERAL VIEWS)
# X-Ray	XRAY UPPER LIMB (AP & LATERAL VIEW)