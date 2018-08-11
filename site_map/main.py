from flask import Flask, render_template, request, jsonify
from site_map.watchfile import watch
import subprocess, json, os

app = Flask(__name__)


@app.route("/index")
def hello():
    return render_template("index-site.html")


@app.route("/result")
def result():
    try:
        os.remove("FinalResults.csv")
    except OSError:
        print("error removing files")
        pass

    result_r = watch()
    print("Returning" + result_r)

    try:
        os.remove("Raw Data.csv")
        os.remove("FinalResults.csv")
    except OSError:
        print("error removing files" + str(OSError))
        pass
    return json.dumps(result_r)


@app.route("/go", methods=['POST'])
def go():
    with open('Raw Data.csv', 'w') as csvfile:
        csvfile.write(request.get_json())

    # subprocess.call(["/usr/bin/Rscript", "--vanilla", "ETLProcessRF.R"], shell=False)
    subprocess.call(["/usr/local/bin/Rscript", "--vanilla", "ETLProcessRF.R"], shell=False)

    resp = jsonify("ok")
    resp.status_code = 200

    return resp


if __name__ == "__main__":
    app.run(debug=True)
