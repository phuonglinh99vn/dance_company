package dance_company.usermanagement.model;

import org.apache.log4j.Logger;

public class LoggingService {
	   private static final Logger logger = Logger.getLogger(LoggingService.class);

	   public static void logError(String message, Exception e) {
	      logger.error(message, e);
	   }
}
