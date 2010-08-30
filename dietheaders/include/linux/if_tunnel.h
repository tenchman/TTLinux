#ifndef _IF_TUNNEL_H_
#define _IF_TUNNEL_H_

#include <linux/types.h>

#define SIOCGETTUNNEL   (SIOCDEVPRIVATE + 0)
#define SIOCADDTUNNEL   (SIOCDEVPRIVATE + 1)
#define SIOCDELTUNNEL   (SIOCDEVPRIVATE + 2)
#define SIOCCHGTUNNEL   (SIOCDEVPRIVATE + 3)

#define GRE_CSUM	htons(0x8000)
#define GRE_ROUTING	htons(0x4000)
#define GRE_KEY		htons(0x2000)
#define GRE_SEQ		htons(0x1000)
#define GRE_STRICT	htons(0x0800)
#define GRE_REC		htons(0x0700)
#define GRE_FLAGS	htons(0x00F8)
#define GRE_VERSION	htons(0x0007)

struct ip_tunnel_parm
{
	char			name[IFNAMSIZ];
	int			link;
	__be16			i_flags;
	__be16			o_flags;
	__be32			i_key;
	__be32			o_key;
	struct iphdr		iph;
};

#endif /* _IF_TUNNEL_H_ */
