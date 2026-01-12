INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Tom Hanks', '0001', '12/01/1977', NULL, NULL);
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Juan Gonzalez', '0002', '03/23/1992', NULL, 'Colorbind');
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Julian Smith', '0003', '11/24/1983', NULL, NULL);
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Colleen Burch', '0004', '05/18/2000', NULL, 'Left leg amputated');
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Taylor Akers', '0005', '02/02/1998', NULL, NULL);
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Whitney Young', '0006', 07/02/1990, NULL, NULL);
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Jeff Melton', '0007', '01/26/1961', NULL, '3 bulging discs in lower lumbar');
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Vicki Weeks', '0008', '04/19/1986', NULL, 'Hallucinogenic schizophrenia');
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Yazmin Rubio', '0009', '06/08/1999', NULL, NULL);
INSERT INTO SUBJECTS(SUBJECT_NAME, SUBJECT_ID, SUBJECT_DOB,SUBJECT_GENETIC_TRANSCRIPT, SUBJECT_IMPAIRMENTS)
  VALUES('Mario Monterroso', '0010', '10/10/1994', NULL, NULL);
COMMIT;

"""The following block of code inserts data into the SENSES table."""
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0001', '0001', 'Audition', '30dB (deciBels)', 'None', 'Auditory, Visual, and Neural');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0002', '0001', 'Vision', '20/20 (vision score) and 12 (Ishihara test)', 'None', 'Visual and Neural');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0003', '0001', 'Gustation', '10 (prefers sucrose)', 'Sense strength is entirely measured via self-perception and preference for sweet vs. bitter', 'Gustatory, Somatosensory, Neural, Olfactory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0004', '0001', 'Somatosensation', '10mm (on left arm)', 'Sense strength is entirely measured via self-perception of distinction between two points on body', 'Somatosensory, Neural, Visual, Auditory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0005', '0001', 'Nociception', 'Hormonal Assay- Normal Range, electroencephalogram (EEG) results show high sensitivity, behavioral analysis shows subject to be in the middle given hormonal assay and EEG)', 'Behavioral analysis is based on perception of researcher', 'Neural, Somatosensory, Visual, Auditory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('0006', '0001', 'Olfaction', 'Successfully identifies 10/10 smells emitted by olfactometer', 'None', 'Olfactory, Neural, Visual');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1001', '0002', 'Audition', '20dB (deciBels)', 'None', 'Auditory, Visual, and Neural');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1002', '0002', 'Vision', '20/15 (vision score) and 8 (Ishihara test)', 'None', 'Visual and Neural');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1003', '0002', 'Gustation', '10 (prefers sucrose)', 'Sense strength is entirely measured via self-perception and preference for sweet vs. bitter', 'Gustatory, Somatosensory, Neural, Olfactory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1004', '0002', 'Somatosensation', '9mm (on left arm)', 'Sense strength is entirely measured via self-perception of distinction between two points on body', 'Somatosensory, Neural, Visual, Auditory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1005', '0002', 'Nociception', 'Hormonal Assay- Normal Range, electroencephalogram (EEG) results show medium-high sensitivity, behavioral analysis shows subject to be in the middle given hormonal assay and EEG)', 'Behavioral analysis is based on perception of researcher', 'Neural, Somatosensory, Visual, Auditory');
INSERT INTO SENSES(SENSE_ID, SUBJECT_ID, SENSE_TYPE, SENSE_STRENGTH, SENSE_INHIBITIONS, SENSE_BIOLOGICAL_PATHWAYS)
  VALUES('1006', '0002', 'Olfaction', 'Successfully identifies 10/10 smells emitted by olfactometer', 'None', 'Olfactory, Neural, Visual'); 
COMMIT;

"""The following block of code inserts data into the RESPONSES table."""
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0001', '0001', 'Neural response to auditory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Auditory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0002', '0001', 'Neural response to visual stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Visual and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0003', '0001', 'Neural response to olfactory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Olfactory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0004', '0001', 'Neural response to somatosensory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Somatosensory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0005', '0001', 'Neural response to nociceptory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Nociceptory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('0006', '0001', 'Neural response to gustatory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Gustatory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1001', '0002', 'Neural response to auditory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Auditory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1002', '0002', 'Neural response to visual stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Visual and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1003', '0002', 'Neural response to olactory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Olfactory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1004', '0002', 'Neural response to somatosensory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Somatosensory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1005', '0002', 'Neural response to nociceptory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Nociceptory and Neural');
INSERT INTO RESPONSES(RESPONSE_ID, SUBJECT_ID, RESPONSE_TYPE, RESPONSE_STRENGTH, RESPONSE_INHIBITIONS, RESPONSE_BIOLOGICAL_PATHWAYS)
  VALUES('1006', '0002', 'Neural response to gustatory stimulus', 'Varying EEG activity recorded', 'Lack of adequate myelination in subject', 'Gustatory and Neural');
COMMIT;

"""The following block of code inserts data into the MEASUREMENTS table."""
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0001', '0001', '0001', 'Auditory', '60 db (deciBels)', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0002', '0001', '0002', 'Visual', '4x4 inch image flashed on a 12x9 screen 4 times for 2 seconds each time', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0003', '0001', '0006', 'Olfactory', '1 lb. of gas released into 12x15 foot room', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0004', '0001', '0004', 'Somatosensory', '2 lbs. of pressure exerted 6 inches apart on left arm', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0005', '0001', '0003', 'Gustatory', 'The equivalent of 1 teaspoon of sucrose', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0006', '0001', '0005', 'Nociceptory', 'Shown a visual and audio recording of another human in varying degrees of pain for 2 minutes', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0007', '0001', '0001', 'Auditory', '60 db (deciBels)', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0008', '0002', '0002', 'Visual', '4x4 inch image flashed on a 12x9 screen 4 times for 2 seconds each time', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0009', '0002', '0006', 'Olfactory', '1 lb. of gas released into 12x15 foot room', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0010', '0002', '0004', 'Somatosensory', '2 lbs. of pressure exerted 6 inches apart on left arm', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0011', '0002', '0003', 'Gustatory', 'The equivalent of 1 teaspoon of sucrose', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
INSERT INTO MEASUREMENTS(MEASUREMENT_ID, SUBJECT_ID, SENSE_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, RESPONSE_STRENGTH, MEASUREMENT_TYPE, MEASUREMENT_INHIBITIONS, MEASUREMENT_BIOLOGICAL_PATHWAYS, MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY, MEASUREMENT_NOTABLE_NEURAL_RESPONSES)
  VALUES('0012', '0002', '0005', 'Nociceptory', 'Shown a visual and audio recording of another human in varying degrees of pain for 2 minutes', 'Reflected in EEG patterns obtained', 'Electrical', 'None', 'Neural', '[This column would ideally link to 1 collective image containing MRI, EEG, and fNIRS data in order to provide a view of whole brain response activity]', '[This would be a written description of any notable responses observed in the whole brain image]');
COMMIT;

"""The following block of code inserts data into the STIMULUS table."""
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0001', '0001', 'Auditory', '60 db (deciBels)', 'None', 'Auditory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0002', '0001', 'Visual', '4x4 inch image flashed on a 12x9 screen 4 times for 2 seconds each time', 'None', 'Visual and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0003', '0001', 'Somatosensory', '2 lbs. of pressure exerted 6 inches apart on left arm', 'None', 'Somatosensory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0004', '0001', 'Olfactory', '1 lb. of gas released into 12x15 foot room','None', 'Olfactory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0005', '0001', 'Nociceptory', 'Shown a visual and audio recording of another human in varying degrees of pain for 2 minutes', 'None', 'Auditory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('0006', '0001', 'Gustatory', 'The equivalent of 1 teaspoon of sucrose', 'None', 'Auditory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1001', '0002', 'Auditory', '60 db (deciBels)', 'None', 'Auditory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1002', '0002', 'Visual', '4x4 inch image flashed on a 12x9 screen 4 times for 2 seconds each time', 'None', 'Visual and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1003', '0002', 'Somatosensory', '2 lbs. of pressure exerted 6 inches apart on left arm', 'Subject is colorblind', 'Somatosensory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1004', '0002', 'Olfactory', '1 lb. of gas released into 12x15 foot room', 'None', 'Olfactory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1005', '0002', 'Nociceptory', 'Shown a visual and audio recording of another human in varying degrees of pain for 2 minutes', 'None', 'Auditory and Neural');
INSERT INTO STIMULUS(STIMULUS_ID, SUBJECT_ID, STIMULUS_TYPE, STIMULUS_STRENGTH, STIMULUS_INHIBITIONS, STIMULUS_BIOLOGICAL_PATHWAYS)
  VALUES('1006', '0002', 'Gustatory', 'The equivalent of 1 teaspoon of sucrose', 'None', 'Auditory and Neural');
COMMIT;
