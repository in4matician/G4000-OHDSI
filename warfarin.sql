/* Find other drugs that contains Warfarin AND Dabigratran */

SELECT de.PERSON_ID, MIN(de.DRUG_EXPOSURE_START_DATE) as INDEX_DATE
    FROM DRUG_EXPOSURE de
    WHERE de.DRUG_CONCEPT_ID IN (
        SELECT ca.descendant_concept_id
            FROM concept_ancestor ca
            WHERE ca.ancestor_concept_id = 1310149 /* Warfarin */)
    GROUP BY de.PERSON_ID;
