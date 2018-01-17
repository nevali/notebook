# CryptoDNS

Originally at https://neva.li/post/2414852675

I had an idea recently, on the back of something I came up with a while ago.

In a nutshell, it’s a dynamic DNS service, not a million miles away from DynDNS, but it has a few crucial differences:

* you don’t need to register anything to use it
* you don’t get to choose the domain name — one is generated for you
* the domain names are nonetheless predictable
* you can only provide <code>SRV</code> and <code>TXT</code> records in the form `_service._proto.assigneddomain`

The way it works is this:

* We agree on a public key-based algorithm. Something like RSA, perhaps.
* Everything that needs to (people, hosts, individual pieces of software) can generate a keypair.
* All write requests to the service are signed with the private key.
* The assigned (generated) domain name has the form `sequence.key-id.suffix`.
* `key-id` is the first 32 or 64-bits of a hash (say, SHA-256) of the public key.
* A `TXT` record is associated with the domain name `key-id.suffix`, containing the full public key and sequence value for each of the keys which reduce to that `key-id` (though in the majority of cases, there will probably only be one).

Given a service operating this way, something or somebody can obtain an (admittedly ugly) domain name, register records
for services beneath it, and relay it to others. For example, an XMPP server running behind NAT could generate a key
for itself, obtain a domain name, perform a port mapping via UPnP, register `_xmpp-server` `SRV` records pointing at
its public IP, and publish JIDs ending in `@seq.key-id.suffix`.

In a similar vein, given an SSH host’s public key, you could locate that host’s public IP (assuming it has one) and
establish a connection—this could all be automated, by for example reading the information in
`~/.ssh/known_hosts`. Of course, such things would need a list of `suffix` values — i.e., the domain names of services
providing this facility — but that could be a configurable option with some well-known defaults.
