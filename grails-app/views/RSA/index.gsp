<!doctype html>
<html>
<head>
    <title>RSA Encrypt/Decrypt</title>
    <meta name="layout" content="main">
    <style>
        .wrapper{
            width: 100%;
            text-align: center;
        }
        .content{
            width: 50%;
            display: inline-block;
            padding: 10px;
            box-shadow: 5px 10px 8px #888888;
            border-radius: 10px;
            margin: 1%;
            background-color: #4246493d;
        }
        .results-table{
            width: 60%;
            margin-left: 20%;
        }
        textarea {
            resize: vertical;
            width: 100%;
        }
        input {
            width:100%;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="content">
        <h1>RSA Encryption/Decryption</h1>
        <g:form action="encrypt">
            <label>Message to Encrypt:
                <input name="originalText" type="text">
            </label>
            <button type="submit">Go</button>
        </g:form>
        <g:if test="${results}">
            <div class="results">
                <h2>Results</h2>
                <table class="results-table">
                    <tr>
                        <td>
                            <label class="result-item">Original:</label>
                        </td>
                        <td>
                            <input type="text" disabled value="${results.original}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="result-item">Encrypted:</label>
                        </td>
                        <td>
                            <textarea disabled cols="50">${results.encrypted}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="result-item">Decrypted:</label>
                        </td>
                        <td>
                            <input type="text" disabled value="${results.decrypted}">
                        </td>
                    </tr>
                </table>
            </div>
        </g:if>
    </div>
</div>
</body>
</html>
