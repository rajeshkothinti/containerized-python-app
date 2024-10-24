
import math
from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/')
def facti():
    return render_template('index.html')

@app.route('/', methods=['POST'])
def form_post():
    
    inp = int(request.form['Factorial'])
    fac = math.factorial(inp)
    return f"The factorial of {inp} is {fac}."


if __name__ == '__main__':
    app.run()