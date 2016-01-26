package com.wso2telco.utils;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "LOAConfiguration")
public class LOAConfig {

	private List<LOA> loas;

	@XmlElement(name = "LOA", nillable = false)
	public List<LOA> getLoas() {
		return loas;
	}

	public void setLoas(List<LOA> loas) {
		this.loas = loas;
	}

	public LOA getLOA(String level) {
		for (LOA loa : loas) {
			if (loa.getLevel().equals(level)) {
				return loa;
			}
		}
		return null;
	}

	public void init() {
		for (LOA loa : loas) {
			loa.init();
		}
	}

	public void print() {
		for (LOA loa : loas) {
			List<Authenticators> l = loa.getAuthentication().getAuthenticatorList();
			System.out.println(l.size());
			for (Authenticators s : l) {
				List<Authenticator> d = s.getAuthenticators();
				for (Authenticator v : d) {
					System.out.println(v.getAuthenticatorName());
				}
			}
		}
	}

}
/*
@XmlRootElement(name = "LOAConfiguration")
public class LOAConfig {


    private List<LOA> loas;

    @XmlElementWrapper(name = "LOAConfiguration", nillable = false)
    @XmlElement(name = "LOA", nillable = false)
    public List<LOA> getLoas() {
        return loas;
    }

    public void setLoas(List<LOA> loas) {
        this.loas = loas;
    }

    public LOA getLOA(String level) {
        for (LOA loa : loas) {
            if (loa.getLevel().equals(level)) {
                return loa;
            }
        }
        return null;
    }

    public void init() {
        for (LOA loa : loas) {
            loa.init();
        }
    }

    public void print(){
        for(LOA loa: loas){
            List<String> l = loa.getAuthenticatorNames();
            for(String s : l){
                System.out.println(s);

            }
        }
    }

}
*/