.phony: ssl clean

ssl:
	cfssl gencert -initca ca-csr.json | cfssljson -bare ca

clean:
	rm -f *.pem *.csr