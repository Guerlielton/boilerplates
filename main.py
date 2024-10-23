import sys # Import the sys module to access command-line arguments

def main(): # Define the main function
    if len(sys.argv) != 2: # Check if the number of command-line arguments is not equal to 2
        print("Usage: python script.py <number>") # Print the usage message
        sys.exit(1) # Exit the program with an error code