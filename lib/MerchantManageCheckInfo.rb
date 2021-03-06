require 'rubygems'
require 'httparty'
#This class will allows you to consume service operation that allows you to add, update, and delete check payment information
class MerchantManageCheckInfo
#This method returns string response
#url - base url of service
#Username - Your PayLeap API login ID.
#Password - Your PayLeap API transaction key.
#TransType - The transaction type being performed. Valid values are:
#Add
#Update
#Delete
#Vendor - Your PayLeap Vendor number that uniquely identifies your merchant account.
#CustomerKey - Unique numerical identifier for the customer. Found in the response values of operations for managing #customer information and adding recurring payments.
#CheckInfoKey - Unique numerical identifier for check. Found in the response values for AddRecurringCheck.
#CheckType - Indicates check type. Valid values are:
#Personal
#Business
#AccountType - Indicates to which type of account the check points. Valid values are:
#Checking
#Savings
#CheckNum - The check number printed on the check.
#MICR - The scanned MICR data of the check.
#AccountNum - The account number printed on the check.
#TransitNum - The routing number printed on the check.
#SS - The customerís Social Security Number in ###-###-#### format.
#DOB - The customerís date of birth in MM/DD/YYYY format.
#BranchCity - The city in which the branch of the bank is located.
#DL - The customerís date of birth in MM/DD/YYYY format.
#StateCode - The customerís two-digit driverís license state or province code.
#NameOnCheck - The customerís name as printed on the check.
#Email - Customerís billing email address.
#DayPhone - Customerís phone number in ###-###-#### format.
#Street1 - Line 1 of customerís street address.
#Street2 - Line 2 of customerís street address.
#Street3 - Line 3 of customerís street address.
#City - Customerís city.
#StateID - Customerís 2-digit state code.
#Province - Customerís province if outside the USA.
#PostalCode - Customerís ZIP or postal code.
#CountryID - Customerís 3-digit country code. For example: USA, CAN.
#ExtData - Not used for this operation.
 def ManageCheckInfo(url,userName,password,transType, vendor, customerKey, checkInfoKey, checkType,accountType,checkNum,mICR, accountNum, transitNum, sS, dOB, branchCity, dL, stateCode, nameOnCheck, email, dayPhone,street1,street2,street3,city, stateID,province, postalCode, countryID, extData)
    
	data = 'Username='+userName+'&Password='+password+'&TransType='+transType+'&Vendor='+vendor+'&CustomerKey='+customerKey+'&CheckInfoKey='+checkInfoKey+'&CheckType='+checkType+'&AccountType='+accountType+'&CheckNum='+checkNum+'&MICR='+mICR+'&AccountNum='+accountNum+'&TransitNum='+transitNum+'&SS='+sS+'&DOB='+dOB+'&BranchCity='+branchCity+'&DL='+dL+'&StateCode='+stateCode+'&NameOnCheck='+nameOnCheck+'&Email='+email+'&DayPhone='+dayPhone+'&Street1='+street1+'&Street2='+street2+'&Street3='+street3+'&City='+city+'&StateID='+stateID+'&Province='+province+'&PostalCode='+postalCode+'&CountryID='+countryID+'&ExtData='+extData
	begin
	strresponse = ""
    response = HTTParty.get(URI.encode(url+'?'+data))
    data = response.parsed_response
    if (data['RecurringResult']['Code'].to_s == "Ok")
          strresponse = strresponse + data['RecurringResult']['Error'].to_s + ", Your CustomerKey=" + data['RecurringResult']['CustomerKey'].to_s + ", Your CheckInfo key=" + data['RecurringResult']['CheckInfoKey'].to_s
     else
       strresponse = strresponse + data['RecurringResult']['Error'].to_s
        end   
        return strresponse
	rescue Exception => e
        return e.message
    end	
   end
end