import java.util.*;
import java.lang.*;

// Added CPU Assist for extra credit

public class TicTacToe {
    public static void main(String[] args)  {
        Scanner input = new Scanner(System.in);
        String[][] state = {{" 1 ", "|", " 2 ", "|", " 3 "},
                            {"---", "+", "---", "+", "---"},
                            {" 4 ", "|", " 5 ", "|", " 6 "},
                            {"---", "+", "---", "+", "---"},
                            {" 7 ", "|", " 8 ", "|", " 9 "}};

        System.out.println("Enter 1 for 2 players mode or enter 2 for playing against the CPU or enter 0 to quit");
        int mode = input.nextInt();                           
        printBoard(state);

        boolean flag = true;
        boolean[] result = new boolean[4];
        int errorsPlayer1 = 0;
        int consecutivePlayer1 = 0;
        int errorsPlayer2 = 0;
        int consecutivePlayer2 = 0;
        int assistCountP1 = 0;
        int assistCountP2 = 0;
        do {
            try{
                int move;
                if (consecutivePlayer1 == 3 || errorsPlayer1 == 5)  {
                    System.out.println("Player 1 forfeits the game due to reaching the maximum incorrect entries.");
                    break;
                }
                if (assistCountP1 < 2 & mode == 1) {
                    System.out.println();
                    System.out.println("(Enter 000 for CPU Assist -- " + assistCountP1 + "/2 used so far)" );
                }
                System.out.print("Enter Player 1 move: ");
                String moveString = input.next();
                boolean cpuCondition = moveString.equals("000") & mode == 1;
                // Added CPU Assist for extra credit
                if (cpuCondition) {
                    if (assistCountP1 < 2) {
                        assistCountP1++;
                        move = CPU.cpuMove(state);
                    }
                    else {
                        errorsPlayer1++;
                        consecutivePlayer1++;
                        System.out.println("Player 1 reached max CPU assists, please try again.");
                        continue;
                    }
                }
                else {
                    move = Integer.parseInt(moveString);
                }
                
                if (move == 0)  {
                    System.out.println("Player 1 forfeits the game due to entering 0 as an input.");
                    break;
                }
                int[] indices = convertMoveToIndex(move);
                if (state[indices[0]][indices[1]] == " X " || state[indices[0]][indices[1]] == " O ")   {
                    consecutivePlayer1 ++;
                    errorsPlayer1 ++;
                    System.out.println("Incorrect entry, please try again.");
                    continue;
                }
                consecutivePlayer1 = 0;
                state = updateBoard(move, 1, state);
                result = determineEnd(state);
                if (result[0]) {
                    flag = false;
                    printEndMessage(result, mode);
                    break;
                }

                if (mode == 1 & result[0] != true)  {
                    boolean inputFlag = true;
                    while (inputFlag)   {
                        try {
                            System.out.println("(Enter 000 for CPU Assist -- " + assistCountP2 + "/2 used so far)" );
                            System.out.print("Enter Player 2 move: ");
                            moveString = input.next();
                            cpuCondition = moveString.equals("000") & mode == 1;
                            // Added CPU Assist for extra credit
                            System.out.println("len: " + moveString.length);
                            if (cpuCondition) {
                                if (assistCountP2 < 2) {
                                    assistCountP2++;
                                    move = CPU.cpuMove(state);
                                }
                                else {
                                    errorsPlayer2++;
                                    consecutivePlayer2++;
                                    if (consecutivePlayer2 >= 3 || errorsPlayer2 >= 5) {
                                        System.out.println("Player 2 forfeits the game due to reaching the maximum incorrect entries.");
                                        break;
                                    }
                                    else {
                                        System.out.println("Player 2 reached max CPU assists, please try again.");
                                        continue; 
                                    }
                                }
                            }
                            // else if (moveString.length > 1) {
                            // }
                            else {
                                move = Integer.parseInt(moveString);
                            }
                            indices = convertMoveToIndex(move);
                            if (state[indices[0]][indices[1]] != " X " && state[indices[0]][indices[1]] != " O ") {
                                inputFlag = false;
                                break;
                            }

                            if (move == 0)  {
                                System.out.println("Player 2 forfeits the game due to entering 0 as an input.");
                                break;
                            }
                            if (consecutivePlayer2 >= 3 || errorsPlayer2 >= 5)  {
                                System.out.println("Player 2 forfeits the game due to reaching the maximum incorrect entries.");
                                break;
                            }
                            System.out.println("Incorrect  entry, please try again.");
                            consecutivePlayer2 ++;
                            errorsPlayer2 ++;
                        }
                        catch (Exception e) {
                            System.out.println("Incorrect entry, please try again.");
                            consecutivePlayer2++;
                            errorsPlayer2++;
                            input.nextLine();
                        }
                    }
                    if (consecutivePlayer2 >= 3 || errorsPlayer2 >= 5 || move == 0)  {
                        break;
                    }
                    consecutivePlayer2 = 0;
                    state = updateBoard(move, 2, state);
                }
                else if (mode == 2)   {
                    move = CPU.cpuMove(state);
                    state = updateBoard(move, 2, state);
                }

                result = determineEnd(state);
                if (result[0]) {
                    flag = false;
                    printEndMessage(result, mode);
                }
            }
            catch(Exception e){
                System.out.println("Incorrect entry, please try again.");
                consecutivePlayer1 ++;
                errorsPlayer1 ++;
                input.nextLine();
            }
        }
        while (flag);
        input.close();
    }

    public static void printBoard(String[][] state)   {
        // takes in array called state (state of the board) and prints out the corresponding tic-tac-toe board
        System.out.println();
        for (int i=0; i<state.length; i++)  {
            for (int j=0; j<state[i].length; j++)   {
                System.out.print(state[i][j]);
            }
            System.out.println();
        }
        System.out.println();
    }

    public static String[][] updateBoard(int move, int player, String[][] state) {
        //updates the state array for a given turn represented by parameters firstMove and secondMove
        int[] playerMove = convertMoveToIndex(move);
        String symbol;
        if (player == 1)    {
            symbol = " X ";
        }
        else    {
            symbol = " O ";
        }
        state[playerMove[0]][playerMove[1]] = symbol;
        printBoard(state);
        return state;
    }

    public static boolean[] determineEnd(String[][] state)  {
        // takes in the state array and returns an array with the first position indicating if the game is over and the subsequent positions determining the winner
        boolean[] result = new boolean[4];
        String[] firstRow = state[0];
        String[] secondRow = state[2];
        String[] thirdRow = state[4];
        String[] firstColumn = {state[0][0], state[2][0], state[4][0]};
        String[] secondColumn = {state[0][2], state[2][2], state[4][2]};
        String[] thirdColumn = {state[0][4], state[2][4], state[4][4]};
        String[] firstDiagonal = {state[0][0], state[2][2], state[4][4]};
        String[] secondDiagonal= {state[0][4], state[2][2], state[4][0]};
        String[][] conditions = {firstRow, secondRow, thirdRow, firstColumn, secondColumn, thirdColumn, firstDiagonal, secondDiagonal};

        int numCount = 0;
        for (int i=0; i<conditions.length; i++) {
            int xCount = 0;
            int oCount = 0;
            for (int j=0; j<conditions[i].length; j++) {
                if (conditions[i][j] == " X ")    {
                    xCount++;
                }
                else if (conditions[i][j] == " O ")   {
                    oCount++;
                }
                else    {
                    numCount++;
                }
            }
            if (xCount == 3) {
                result[0] = true;
                result[1] = true;
            }
            else if (oCount == 3)   {
                result[0] = true;
                result[2] = true;
            }
        }

        // numCount = 6 for the separating characters "|"
        if (numCount == 6)  {
            result[0] = true;
            result[3] = true;
        }

        return result;
    }

    public static void printEndMessage(boolean[] result, int mode)    {
        // prints the ending message depending on the results of the game given by parameter result
        if (result[1] == true)  {
            System.out.println("Game Over! Player 1 Wins.");
        }
        else if (result[2] == true) {
            if (mode == 1) System.out.println("Game Over! Player 2 Wins.");
            else if (mode == 2) System.out.println("Game Over! CPU Wins.");
        }
        else if (result[3] == true) {
            System.out.println("Game Over! It is a tie.");
        }


    }

    public static int[] convertMoveToIndex(int position)    {
        // takes in parameter position and converts it to an index position on the state array
        int[] index = new int[2];
        switch (position)   {
            case 1:
                index[0] = 0;
                index[1] = 0;
                break;
            case 2:
                index[0] = 0;
                index[1] = 2;
                break;
            case 3:
                index[0] = 0;
                index[1] = 4;
                break;
            case 4:
                index[0] = 2;
                index[1] = 0;
                break;
            case 5:
                index[0] = 2;
                index[1] = 2;
                break;
            case 6:
                index[0] = 2;
                index[1] = 4;
                break;
            case 7:
                index[0] = 4;
                index[1] = 0;
                break;
            case 8:
                index[0] = 4;
                index[1] = 2;
                break;
            case 9:
                index[0] = 4;
                index[1] = 4;
                break;
        }
        return index;
    }
}
public class CPU {
    public static int convertIndexToMove(int[] tileIndex) {
        // takes the index of a tile and returns the move/tile number
        int row = tileIndex[0];
        int col = tileIndex[1];
        int move = 0;
        switch (row) {
            case 0:
                if (col == 0) move = 1;
                else if (col == 2) move = 2;
                else if (col == 4) move = 3;
                break;
            case 2:
                if (col == 0) move = 4;
                else if (col == 2) move = 5;
                else if (col == 4) move = 6;
                break;
            case 4:
                if (col == 0) move = 7;
                else if (col == 2) move = 8;
                else if (col == 4) move = 9;
                break;
        }
        return move;
    }

    public static int cpuMove(String[][] state) {
        // Finds next CPU move prioritizing (1) winning (2) not losing (3) basic "good" moves (4) next valid move
        String[] firstRow = state[0];
        String[] secondRow = state[2];
        String[] thirdRow = state[4];
        String[] firstColumn = {state[0][0], state[2][0], state[4][0]};
        String[] secondColumn = {state[0][2], state[2][2], state[4][2]};
        String[] thirdColumn = {state[0][4], state[2][4], state[4][4]};
        String[] firstDiagonal = {state[0][0], state[2][2], state[4][4]};
        String[] secondDiagonal = {state[0][4], state[2][2], state[4][0]};
        String[][] conditions = {firstRow, secondRow, thirdRow, firstColumn, secondColumn, thirdColumn, firstDiagonal, secondDiagonal};
        int move = 0;
        int turn = 0;
        boolean oneIsEmpty = state[0][0].equals(" 1 ");
        boolean centerIsEmpty = state[2][2].equals(" 5 ");
        boolean threat = false;


        // Attempt to find the next best winning/not losing move
        for (int i = 0; i < conditions.length; i++) {
            int numCount = 0;
            int xCount = 0;
            int oCount = 0;
            for (int j = 0; j < conditions[i].length; j++) {
                if (conditions[i][j] == " X ") {
                    xCount++;
                    numCount++;
                } else if (conditions[i][j] == " O ") {
                    oCount++;
                    numCount++;
                }
            }
            if (oCount == 2 & numCount != 3) {
                // Find winning tile
                move = bestMove(conditions[i], i, state);
                break;
            } else if (xCount == 2 & numCount != 3) {
                // Find tile to prevent a loss
                threat = true;
                move = bestMove(conditions[i], i, state);
            }
        }

        if (centerIsEmpty & threat == false) {
            // basic "good" move
            move = 5;
            turn++;
        } else if (oneIsEmpty & threat == false & move == 0) {
            // basic "good" move
            move = 1;
            turn++;
        }

        if (move == 0) {
            // if all else fails
            move = failSafe(state);
        }

        System.out.print("\nCPU Move: " + move + "\n");

        return move;
    }

    public static int bestMove(String[] condition, int condIndex, String[][] state) {
        // Finds the next best move: Prioritizing (1) winning in one move (2) preventing a loss after Player1's move

        // String[] whichCond(Indexes) =   {0,        1,         2,         3,          4,             5,           6,             7,           };
        String[] whichCond = {"firstRow", "secondRow", "thirdRow", "firstColumn", "secondColumn", "thirdColumn", "firstDiagonal", "secondDiagonal"};
        int move = 0;

        // Check First Diagonal
        if (whichCond[condIndex].equals("firstDiagonal")) {
            int[][] firstDiagIndex = {{0, 0}, {2, 2}, {4, 4}};
            for (int i = 0; i < firstDiagIndex.length; i++) {
                int x = firstDiagIndex[i][0];
                int y = firstDiagIndex[i][1];
                String currentArr = state[x][y].replaceAll("\\s+", "");
                if (Character.isDigit(currentArr.charAt(0))) {
                    int[] tileIndex = {x, y};
                    move = convertIndexToMove(tileIndex);
                    break;
                }
            }
        }

        // Check Second Diagonal
        if (whichCond[condIndex].equals("secondDiagonal")) {
            int[][] secondDiagIndex = {{0, 2}, {2, 2}, {4, 0}};
            for (int i = 0; i < secondDiagIndex.length; i++) {
                int x = secondDiagIndex[i][0];
                int y = secondDiagIndex[i][1];
                String currentArr = state[x][y].replaceAll("\\s+", "");
                if (Character.isDigit(currentArr.charAt(0))) {
                    int[] tileIndex = {x, y};
                    move = convertIndexToMove(tileIndex);
                    break;
                }
            }
        }

        // Check Rows
        if (condIndex < 4) {
            for (int i = 0; i < condition.length; i++) {
                String cStripped = condition[i].replaceAll("\\s+", "");
                try {
                    move = Integer.parseInt(cStripped);
                    break;
                } catch (NumberFormatException e) {
                    move = 0;
                }
            }
        }

        // Check Columns
        if (condIndex > 2 & condIndex < 6) {
            for (int i = 0; i < condition.length; i++) {
                String cStripped = condition[i].replaceAll("\\s+", "");
                try {
                    move = Integer.parseInt(cStripped);
                    break;
                } catch (NumberFormatException e) {
                    move = 0;
                }
            }
        }
        return move;
    }


    public static int failSafe(String[][] state) {
        // In case other moves are invalid, we choose the next valid move to avoid errors.
        int move = 0;

        for (int i = 0; i < 6; i = i + 2) {
            if (move == 0) {
                for (int j = 0; j < 6; j = j + 2) {
                    boolean isEmpty = !(state[i][j].equals(" O ") | state[i][j].equals(" X "));
                    if (isEmpty) {
                        int[] tileIndex = {i, j};
                        move = convertIndexToMove(tileIndex);
                        break;
                    }
                }
            }
        }
        return move;
    }
}