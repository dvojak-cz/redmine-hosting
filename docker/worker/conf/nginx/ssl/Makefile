.phony: ssl clean

ssl:
	cfssl gencert \
		-ca=../../../../../conf/ssl/ca.pem \
		-ca-key=../../../../../conf/ssl/ca-key.pem \
		-config=ca-config.json \
		server-csr.json | cfssljson -bare server

clean:
	rm -f *.pem *.csr