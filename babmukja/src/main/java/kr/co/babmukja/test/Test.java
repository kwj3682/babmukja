package kr.co.babmukja.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {
	public static void main(String[] args) {
		try {
			AbstractApplicationContext context = new GenericXmlApplicationContext(
						"config/spring/servlet-context.xml"
					);
			TestController controller = context.getBean(TestController.class);
			controller.selectOne();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
