<h2> Networking Fundamentals </h2>

<h3> Networking Layers, Models and Architectures </h3>

<h3> Protocols: What Are They? </h3>

<h3> Network Performance Issues and Concepts </h3>

<h2> The OSI Reference Model </h2>

<h3> Physical Layer </h3>

<h3> Data Link Layer </h3>

<h3> Network Layer </h3>

<h3> Transport Layer </h3>

<h3> Session Layer, Presentation Layer, Application Layer </h3>


<h2> TCP/IP Protocol </h2>

<h3> Lower-Layer Protocols </h3>

<h3> Layer Connection Protocols </h3>

<h3> Internet Layer Protocols </h3>

<h4> IP Subnetting </h4>

Subnetting adds an additional level to the hierarchy of structures used in IP addressing. To support this, IP addresses must be broken into three elements instead of two. This is done by leaving the network ID alone and dividing the host ID into a subnet ID and host ID. These subnet ID bits are used to identify each subnet within the network. Hosts are assigned to subnets in whatever manner makes the most sense for that network. 

Interestingly, the analogy to telephone numbers that we used before still holds in the world of subnetting, and shows how subnetting changes the way IP addresses are interpreted. For example, a number like (401)555-7777 has an area code and a local number. But the local number itself can be broken down into two parts: the exchange and the local extension. This means phone numbers really are comprised of three hierarchical components just as IP addresses are in subnetting. 

Of course, the number of bits in an IP address is fixed at 32. This means that in splitting the host ID into subnet ID and host ID, we reduce the size of the host ID portion of the address. In essence, we are stealing bits from the host ID to use for the subnet ID. 

Now remember when we looked at the sizes of each of the main classes, we saw that for each class, we saw that for each class, the number of networks and the number of hosts per network are a function of how many bits we use for each. The same applies to our splitting of the host ID. Since we are dealing with binary numbers, the number of subnets is two to the power of the subnet ID field. Similarly, the number of hosts per subnet is two to the power of the size of the host ID field.

Let's take a brief example to see how this works. Imagine that we start with Class B network 154.71.0.0. 16 bits are for the network ID (154.71) and 16 for the host ID. In regular classful addressing, there are no sujbnets and 65,534 hosts total. TO subnet this network, we can decide to split those 16 bits however we feel best suits the needs of our network. 

<h4> IP Subnet Masks, Notation and Subnet Calculations </h4>

Subnetting divides an organization's network into a two-level architecture of subnets and hosts. This division is entirely internal and hidden from all other organizations on the Internet. One of the many advantages of this is that each organization gets to make their own choice about how to divide the classful host ID into subnet ID and host ID. 

In a non-subnetted classful environment, routers use the first octet of the IP address to determine what the class is of the address, and from this they know which bits are the network ID and which are the host ID. When we use usbnetting, these routers also need to know how that host ID is divided into subnet ID and host ID. However, this division can be arbitrary for each network. Furthermore, there is no way to tell how many bits belong to each simply by looking at the IP address.

In a subnetting environment, the additional information about which bits are for the subnet ID and which for the host ID must be communicated to devices that interpret IP addresses. This information is given in the form of 32-bit binary number called subnet mask. The term "mask" comes from the binary mathematics concept called bit masking. 

<h5> Function of the Subnet Mask </h5>

There's something about subnet masks that seems to set people's hair on end, especially if they aren'y that familiar with binary numbers. However, the idea behind them is quite straightforward. The mask is a 32-bit number, just as the IP address is a 32-bit number. Each of the 32 bits in the subnet mask corresponds to the bit in the IP address in the same location in the number. The bits of the mask in any given subnetted network are chosen so that the bits ujsed for either the network ID or subnet ID are ones, while the bits used for host ID are zeroes. 

Why bother doing this with a 32-bit binary number? The answer is the magic of boolean logic. We use the subnet mask by applying the boolean AND function between it and the IP address. For each of the 32 bit pairs in the IP address and subnet mask we employ the AND function, the output of which is 1 only if both bits are 1. What this means in practical terms is the following, for each of the 32 bits:


<ul><li> Subnet Bit is A One: In this case, we are ANDing either 0 or 1 in the IP address with a 1. If the IP address bit is a 0, the result of the AND will be 0, and if it is a 1, the AND will be 1. In other words, where the subnet bit is a 1, the IP address is preserved unchanged. </li>

<li> Subnet Bit Is A Zero: Here, we are ANDing with a 0, so the result is always 0 regardless of what the IP is. Thus, when the subnet bit is a 0, the IP address bit is always cleared to 0. </li></ul>

So, when we use the subnet mask on an IP address, the bits in the network ID and subnet ID are left intact, while the host ID bits are removed. Like a mask that blocks part of your face but lets other parts show, the subnet mask blocks some of the address bits (the host bits) and leaves others alone (the network and subnet bits). A router that performs this function is left with the address of the subnet. Since it knows from the class of the network what part is the network ID, it also knows what subnet the address is on. 

<h5> Subnet Mask Notation </h5>

Like IP addresses, subnet masks are always used as a 32-bit binary number by computers. And like IP addresses, using them as 32-bit binary numbers is difficult for humans. Therefore, they are usually converted to dotted decimal notation for convenience, just like IP addresses are. 

Let's take a quick example to show what this is all about. Suppose we have the Class B network 154.71.0.0. We decide to subnet this using 5 bits for the subnet ID and 11 bits for the host ID. In this case, the subnet mask will have 16 ones for the network protion (since this is Class B) followed by 5 ones for the subnet ID, and 11 zeroes for the host ID. Converting to dotted decimal, the subnet mask would be 255.255.248.0. 

<h5> Applying the Subnet Mask: An Example </h5>

Now, let's see how the subnet mask might be used. Suppose we have a host on this network with an IP of 154.71.150.42. A router needs to figure oujt which suibnet this address is on. This is done by performing the masking operation. The host ID bits of the address are stripped so the device can determine the subnet to which the address belongs. 

This result, 154.71.144.0 is the IP address of the subnet to which 154.71.150.42 belongs. There is no need to explicitly differentiate the network ID bits from the subnet bits, because we are still using classful addresses. Any router can see that since the first two bits of of the address are 10, this is a Class B address. So the network ID is 16 bits, and this means the subnet ID must be bits 17 to 21, counting from left. 

So, in practical terms, the subnet mask actually conveys only a single piece of information: where the line is drawn between the subnet ID and host ID. You might wonder why bother with a big 32-bit binary number in that case, instead of just specifying the bit number where the division occurs? The reason is efficiency considerations and support for non-contiguous masks. 
The subnet mask expression is efficient, in that it allows routers to perform a quick masking operation to determine the subnet address. This improves performance; remember that computers were much slower when this system was developed. Today this is not really that much of an issue. 



<h4> IP Classless Addressing </h4>

<h4> IP Datagram Encapsulation and Formatting </h4>

<h4> IP Datagram Devlivery and Routing </h4>

<h4> NAT Protocol </h4>

<h4> IPSec Protocol </h4>

<h4> Mobile IP </h4>


<h4> TCP, UDP </h4>

<h3> DNS </h3> 

<h3> BOOTP, DHCP, SNMP, and RMON </h3>

<h3> HTTP </h3>



























