package mvsvc.ntv;

import com.frankmoley.loader.Counter;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;


@Controller("/example")
public class IndexController {
    @Get(produces = MediaType.TEXT_PLAIN )
    public String getExample(){
        String text = "The people of the United States of America";
        Counter counter = new Counter();
        counter.count(text);
        return "Completed";
    }
}
