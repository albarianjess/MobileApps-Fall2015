package ja.final_project;

/**
 * Created by ashes on 12/10/15.
 */
public class suggestion {


    private String pizza;
    private String pizzaURL;
    private void setCrustInfo(String crust){
        switch (crust){
            case "thin":
                pizza="Pizzaria Locale";
                pizzaURL="http://localeboulder.com/";
                break;
            case "thick":
                pizza="Old Chicago";
                pizzaURL="http://www.oldchicago.com/";
                break;
            default:
                pizza="none";
                pizzaURL="https://www.google.com/search?q=boulder+pizza&ie=utf-8&oe=utf-8";
        }
    }

    public void setCrust(String crust){
        setCrustInfo(crust);
    }

    public void setPizzaURL(String crust){
        setCrustInfo(crust);
    }

    public String getPizza(){
        return pizza;
    }

    public String getPizzaURL(){
        return pizzaURL;
    }
}
