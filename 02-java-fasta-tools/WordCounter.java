/*
   Author: Nichole Cubbage
   Original Date: 11/08/2020
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

public class WordCounter {

    public static void main(String[] args) throws IOException {
        if (args.length == 0) {
            System.out.println("Usage: java WordCounter <filename>");
            return;
        }

        String fileName = args[0];
        int totalCount = 0;

        // TreeMap keeps keys sorted automatically
        Map<String, Integer> wordCounts = new TreeMap<>();

        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        String line;

        while ((line = reader.readLine()) != null) {
            String[] words = line.split(" ");
            for (String w : words) {
                if (w.isEmpty()) continue;
                totalCount++;

                wordCounts.put(w, wordCounts.getOrDefault(w, 0) + 1);
            }
        }

        reader.close();

        System.out.println("That file has " + totalCount + " words.\n");

        System.out.println("Unique words (sorted) with counts:\n");
        for (Map.Entry<String, Integer> entry : wordCounts.entrySet()) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }

        System.out.println("\nAuthor: Nichole Cubbage");
    }
}
