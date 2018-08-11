import os, time, csv


def readfile():
    with open('FinalResults.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        result = ""
        for row in csv_reader:
            if line_count == 0:
                result += f'{row[0]},{row[1]},{row[2]},{row[3]}\n'
                line_count += 1
            else:
                result += f'{row[0]},{row[1]},{row[2]},{row[3]}\n'
                line_count += 1
        print(f'Processed {line_count} lines.')
        print(result)
        return result


def watch():
    path_to_watch = "."
    before = dict([(f, None) for f in os.listdir(path_to_watch)])
    go = True
    while go:
        time.sleep(1)

        after = dict ([(f, None) for f in os.listdir (path_to_watch)])
        added = [f for f in after if not f in before]
        removed = [f for f in before if not f in after]

        if "".join(added) == "FinalResults.csv":
            print("".join(added))
            go = False
            return readfile()

        if removed:
            print("Removed: ", "".join(removed))

        before = after
