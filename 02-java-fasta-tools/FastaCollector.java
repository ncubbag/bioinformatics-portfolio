/*
   Author: Nichole Cubbage
   Original Date: 10/16/2020
 */

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FastaCollector {

    public static void main(String[] args) throws IOException {
        Scanner input = new Scanner(System.in);
        List<String> cloneIDs = new ArrayList<>();
        List<String> sequences = new ArrayList<>();

        while (true) {
            System.out.print("Enter a clone ID (or 'exit' to finish): ");
            String id = input.nextLine().trim();
            if (id.equalsIgnoreCase("exit")) {
                break;
            }

            System.out.print("Enter DNA sequence: ");
            String seq = input.nextLine().trim();
            if (seq.equalsIgnoreCase("exit")) {
                break;
            }

            cloneIDs.add(id);
            sequences.add(seq);
        }

        // Write to FASTA file
        FileWriter file = new FileWriter("FASTAOutput.txt");
        for (int i = 0; i < cloneIDs.size(); i++) {
            file.write(">" + cloneIDs.get(i) + "\n");
            file.write(sequences.get(i) + "\n");
        }
        file.close();

        // Print all sequences in FASTA format
        System.out.println("\nFASTA Output:\n");
        for (int i = 0; i < cloneIDs.size(); i++) {
            System.out.println(">" + cloneIDs.get(i));
            System.out.println(sequences.get(i));
        }
    }
}
