package com.sofka.petstore.runners;

import com.intuit.karate.junit5.Karate;

class PetStoreTestRunner {

    @Karate.Test
    Karate testPetStore() {
        return Karate.run("classpath:com/sofka/petstore/features/pet_workflow.feature").relativeTo(getClass());
    }
}
