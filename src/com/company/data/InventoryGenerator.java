package com.company.data;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Random;

public class InventoryGenerator {
    public static void main(String[] args) throws IOException {
        Random random=new Random();
        Path fileName=Path.of("C:\\Users\\gk\\IdeaProjects\\Multithreading\\src\\com\\company\\data\\data2.sql");
        for (int i = 0; i < 1000; i++) {
            int character = random.nextInt(35) + 2;
            int item = random.nextInt(92) + 1;
            String query =
                    String.format("insert into inventory(character_id, item_id) values (%d,%d);%n", character, item);
            Files.writeString(fileName, query, StandardOpenOption.APPEND);
        }
    }
}
