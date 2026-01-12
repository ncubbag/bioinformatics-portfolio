Entity and Attribute Description 

Entity Name: SENSES
Entity Description: senses to be analyzed- consisting of audition, somatosensation, nociception, vision, olfaction, and gustation
Main attributes of SENSES: 
Attribute Name: SENSE_ID
Attribute Description: ID number for sense
Attribute Name: SENSE_STRENGTH
Attribute Description: strength of stimulus inflicted 
Attribute Name: SENSE_TYPE
Attribute Description: refers to sense type, which can be audition, gustation, vision, nociception, olfaction, and somatosensation
Attribute Name: SENSE_INHIBITIONS
Attribute Description: Input that appears to inhibit information coming to or from a given sense
Attribute Name: SENSE_BIOLOGICAL_PATHWAYS
Attribute Description: A description of the biological pathways encountered by the transactions of information relevant to the sense
Attribute Name: FK_SUBJECT_ID
Attribute Description: ID number for to show which subject the sense belongs to

Entity Name: STIMULUS
Entity Description: stimuli to be enacted upon each subject.
Main attributes of STIMULUS: 
Attribute Name: STIMULUS_ID
Attribute Description: unique identifier for each stimulus
Attribute Name: STIMULUS_STRENGTH
Attribute Description: strength of stimulus inflicted 
Attribute Name: STIMULUS_TYPE
Attribute Description: refers to the stimulus type, which can be visual, auditory, gustatory, olfaction, nociception, and somatosensation
Attribute Name: STIMULUS_ INHIBITIONS
Attribute Description: inhibitions of each stimulus
Attribute Name: STIMULUS_ BIOLOGICAL_PATHWAYS
Attribute Description: biological pathways encountered relevant to transaction of information from each stimulus
Attribute Name: FK_SUBJECT_ID
Attribute Description: ID number for to show which subject the stimulus is being inflicted upon

Entity Name: SUBJECTS
Entity Description: list of subjects and their respective information in which stimuli are being acted upon
Main attributes of SUBJECTS: 
Attribute Name: SUBJECT_ID
Attribute Description: unique identifier for each subject
Attribute Name: SUBJECT_NAME
Attribute Description: name of each subject 
Attribute Name: SUBJECT_IMPAIRMENTS
Attribute Description: impairments each subject may have (if none, answer can be null)
Attribute Name: SUBJECT_DOB
Attribute Description: date of birth for each subject
Attribute Name: SUBJECT_GENETIC_TRANSCRIPT
Attribute Description: genetic transcript of subject (if none, answer can be null)

Entity Name: RESPONSES
Entity Description: responses of each subject from each stimulus- may be electrical, chemical, etc.
Main attributes of RESPONSES: 
Attribute Name: RESPONSE_ID
Attribute Description: unique identifier for each response
Attribute Name: RESPONSE_STRENGTH
Attribute Description: strength of response(s) measured
Attribute Name: RESPONSE_TYPE
Attribute Description: refers to the response type, which can be biological, electrical, chemical
Attribute Name: RESPONSE_INHIBITIONS
Attribute Description: inhibitions of responses (can be genetic or biological)
Attribute Name: RESPONSE_BIOLOGICAL_PATHWAYS
Attribute Description: biological pathways relevant to responses
Attribute Name: FK_SUBJECT_ID
Attribute Description: ID number for to show which subject the responses are coming from

Entity Name: MEASUREMENTS
Entity Description: the collection of measurements from all senses and subject analyzed
Main attributes of MEASUREMENTS: 
Attribute Name: MEASUREMENT_ID
Attribute Description: unique identifier for measurement
Attribute Name: MEASUREMENT_TYPE
Attribute Description: a description of measurement type
Attribute Name: MEASUREMENT_INHIBITIONS
Attribute Description: a description of things that can or do inhibit the measurements
Attribute Name: MEASUREMENT_NOTABLE_NEURAL_RESPONSES
Attribute Description: notable measurement recordings of subject responses to each stimulus
Attribute Name: MEASUREMENT_BIOLOGICAL_PATHWAYS
Attribute Description: biological pathways relevant to measurement
Attribute Name: MEASUREMENT_WHOLE_BRAIN_RESPONSE_ACTIVITY
Attribute Description: an image view of the entire brain’s collective response activity to each stimulus
Attribute Name: FK_RESPONSE_STRENGTH
Attribute Description: strength of response from subject
Attribute Name: FK_SENSE_ID
Attribute Description: foreign key- unique identifier for each sense
Attribute Name: FK_SUBJECT_NAME
Attribute Description: foreign key- name of each subject
Attribute Name: FK_STIMULUS_STRENGTH
Attribute Description: foreign key- strength of stimulus used
Attribute Name: FK_STIMULUS_TYPE
Attribute Description: foreign key- a description of the stimulus type
Attribute Name: FK_SUBJECT_ID
Attribute Description: ID number for to show which subject the information in MEASUREMENTS pertains to

2.	Relationship and Cardinality Description
 
Relationship: receive SENSES and STIMULUS
Cardinality: 1:M between SENSES and STIMULUS. 
Business rule: a sense can receive one to many stimuli; many stimuli can receive one to many senses. 

Relationship: provide RESPONSES and MEASUREMENTS
Cardinality: 1:M between RESPONSES and MEASUREMENTS. 
Business rule: a response will provide one to many measurements; one to many measurements can provide insight to a single response. 

Relationship: generates STIMULUS and RESPONSES
Cardinality: 1:M between STIMULUS and RESPONSES.
Business rule: a stimulus generates one to many responses; responses; one to many responses reflect the generation of a stimulus.

Relationship: can have SUBJECTS and MEASUREMENTS
Cardinality: 1:M between SUBJECTS and MEASUREMENTS.
Business rule: a subject can have one to many measurements; measurements have only one subject in which they belong to.

