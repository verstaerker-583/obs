s/"name": "gp"/"name": "sr"/

s/"color": 4280204915/"color": 4287868617/

s/"color1": 4281467135/"color1": 4287868617/
s/"color2": 4279828552/"color2": 4282145104/

s/gp\/html/sr\/html/

# filters
/^\t\{4\}"enabled":/,/^\t\{3\}{/d
/^\t\{5\}"enabled":/,/^\t\{4\}{/d
