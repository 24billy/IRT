package tw.com.pmt.catsofun.core.common.util;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;
import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.opensymphony.xwork2.conversion.TypeConversionException;

public class LocalDateTimeConvertion extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if (values[0]!=null && values[0].length()!=0) {
			try {
				DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
				return LocalDateTime.parse(values[0],formatter);
			} catch (Exception e) {
				e.printStackTrace();
				throw new TypeConversionException("Invalid format.");
			}
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object output) {
		if (output!=null && output instanceof LocalDateTime) {
			LocalDateTime result = (LocalDateTime)output;
			return result.toString();
		}
		return null;
	}
	
}
