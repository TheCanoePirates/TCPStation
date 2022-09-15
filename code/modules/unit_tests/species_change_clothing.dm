///Gives a Human lizard-incompatible shoes, then changes their species over to see if they drop the now incompatible shoes.
/datum/unit_test/species_change_clothing

/datum/unit_test/species_change_clothing/Run()
	// Test lizards as their own thing so we can get more coverage on their features
	var/mob/living/carbon/human/human_to_lizard = allocate(/mob/living/carbon/human/dummy/consistent)
	human_to_lizard.equipOutfit(/datum/outfit/job/assistant/consistent)
	human_to_lizard.dna.features["legs"] = DIGITIGRADE_LEGS //you WILL have digitigrade legs

	var/obj/item/human_shoes = human_to_lizard.get_item_by_slot(ITEM_SLOT_FEET)
	human_shoes.supports_variations_flags = NONE //do not fit lizards at all costs.

	human_to_lizard.set_species(/datum/species/lizard)

	var/obj/item/lizard_shoes = human_to_lizard.get_item_by_slot(ITEM_SLOT_FEET)
	TEST_ASSERT_NOTEQUAL(human_shoes, lizard_shoes, "Lizard still has shoes after changing species.")
