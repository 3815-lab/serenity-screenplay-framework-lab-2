package com.sofka.petstore.utils;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class PetDataGenerator {

    private static final Random random = new Random();
    private static final String[] ANIMAL_TYPES = { "Dog", "Cat", "Parrot", "Hamster", "Rabbit" };
    private static final String[] ADJECTIVES = { "Happy", "Sad", "Fast", "Slow", "Brave" };

    public static Map<String, Object> getPetData() {
        int id = Math.abs(random.nextInt());
        String name = generatePetName();

        // Construct simplified category
        Map<String, Object> category = new HashMap<>();
        category.put("id", 1);
        category.put("name", "Dogs");

        // Default tag
        Map<String, Object> tag = new HashMap<>();
        tag.put("id", 0);
        tag.put("name", "basic-tag");

        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        data.put("name", name);
        data.put("category", category);
        data.put("photoUrls", Collections.singletonList("https://example.com/photo.jpg"));
        data.put("tags", Collections.singletonList(tag));
        data.put("status", "available");

        return data;
    }

    private static String generatePetName() {
        return ADJECTIVES[random.nextInt(ADJECTIVES.length)] + "_" + ANIMAL_TYPES[random.nextInt(ANIMAL_TYPES.length)]
                + "_" + System.currentTimeMillis();
    }
}
