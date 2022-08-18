from flask  import  Flask
import RPi.GPIO as gpio

plots=3
club=5
ct=7
land=8

gpio.setwarnings(False)
gpio.setmode(gpio.BOARD)
gpio.setup(plots,gpio.OUT)
gpio.setup(club,gpio.OUT)
gpio.setup(ct,gpio.OUT)
gpio.setup(land,gpio.OUT)


gpio.output(plots,gpio.HIGH)
gpio.output(club,gpio.HIGH)
gpio.output(ct,gpio.HIGH)
gpio.output(land,gpio.HIGH)

app=Flask(__name__)


@app.route("/allOn")
def allOn():
    gpio.output(plots,gpio.LOW)
    gpio.output(club,gpio.LOW)
    gpio.output(ct,gpio.LOW)
    gpio.output(land,gpio.LOW)
    return "allOn"

@app.route("/allOff")
def allOff():
    gpio.output(plots,gpio.HIGH)
    gpio.output(club,gpio.HIGH)
    gpio.output(ct,gpio.HIGH)
    gpio.output(land,gpio.HIGH)
    return "allOff"

@app.route("/plotOn")
def plotOn():
    gpio.output(plots,gpio.LOW)
    return "plotOff"

@app.route("/plotOff")
def plotOff():
    gpio.output(plots,gpio.HIGH)
    return "plotOff"

@app.route("/clubOn")
def clubOn():
    gpio.output(club,gpio.LOW)
    return "clubOn"

@app.route("/clubOff")
def clubOff():
    gpio.output(club,gpio.HIGH)
    return "clubOff"

@app.route("/comertialOn")
def comertialOn():
    gpio.output(ct,gpio.LOW)
    return "comertialOn"

@app.route("/comertialOff")
def comertialOff():
    gpio.output(ct,gpio.HIGH)
    return "comertialOff"

@app.route("/landOn")
def landOn():
    gpio.output(land,gpio.LOW)
    return "landOn"

@app.route("/landOff")
def landOff():
    gpio.output(land,gpio.HIGH)
    return "landOff"

if __name__=="__main__":
    app.run(debug=True , host='0.0.0.0', port=5000)