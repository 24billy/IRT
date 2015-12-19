package tw.com.pmt.catsofun.core.common.util;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.opensymphony.xwork2.conversion.TypeConversionException;

public class LocalDateConvertion extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if (values[0]!=null && values[0].length()!=0) {
			try {
				DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd");
				return LocalDate.parse(values[0], formatter);
			} catch (Exception e) {
				e.printStackTrace();
				throw new TypeConversionException("Invalid format.");
			}
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object output) {
		if (output!=null && output instanceof LocalDate) {
			LocalDate result = (LocalDate)output;
			return result.toString();
		}
		return null;
	}

}
