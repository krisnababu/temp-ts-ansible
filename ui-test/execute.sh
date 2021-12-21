#/bin/bash!
	source venv/bin/activate
	pip3 install -r requirements.txt
	      /usr/bin/rm -f reports/*
	      ~/.local/bin/behave -f allure_behave.formatter:AllureFormatter -o reports/ features/
	      ~/allure/bin/allure serve reports/ > stdout 2>&1 &
	      PID=$!
	      /usr/bin/kill -9 $PID
	      line=`/usr/bin/grep 'tmp' stdout`
	      id=`/usr/bin/echo $line | /usr/bin/cut -d '/' -f 3`
	      /usr/bin/cp -rf /tmp/$id/allure-report/* /var/www/html/testreport/
